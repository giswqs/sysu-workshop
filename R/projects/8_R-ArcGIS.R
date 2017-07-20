library(arcgisbinding)
arc.check_product()
enrich_df <- arc.open(path = 'data/crime/San_Francisco_Crimes_Enrich_Subset.shp')
summary(enrich_df)
enrich_select_df <- arc.select(object = enrich_df, fields = c('FID', 'SUM_VALUE', 'TOTPOP10', 'MEDHINC_CY', 'RENTER_CY', 'MEDVAL_CY', 'N13_BUS', 'N37_BUS', 'NLCDfrstPt'))

# install.packages("sp")
library(sp)
enrich_spdf <- arc.data2sp(enrich_select_df)
col_names <- c("OBJECTID", "Crime_Counts",
               "Population", "Med_HomeIncome",
               "Renter_Count", "Med_HomeValue", "Grocery",
               "Restaurant", "Pct_Forest")
colnames(enrich_spdf@data) <- col_names
head(enrich_spdf@data)

# install.packages("spdep")
library(spdep)
n <- enrich_spdf@data$Crime_Counts
x <- enrich_spdf@data$Population
EB <- EBest (n, x)
p <- EB$raw
b <- attr(EB, "parameters")$b
a <- attr(EB, "parameters")$a
v <- a + (b/x)
v[v < 0] <- b/x
z <- (p - b)/sqrt(v)
enrich_spdf@data$EB_Rate <- z

arcgis_df <- arc.sp2data(enrich_spdf)
arc.write('output/San_Francisco_Crime_Rates.shp', arcgis_df)


rate_df <- arc.open('output/San_Francisco_Crime_Rates.shp')
rate_select_df <- arc.select(rate_df, fields = c("OBJECTID_1", "Crime_Coun", "Population", "Med_HomeIn", "Renter_Cou", "Med_HomeVa", "Grocery", "Restaurant", "Pct_Forest", "EB_Rate"))
rate_spdf <- arc.data2sp(rate_select_df)


# Get lower triangle of the correlation matrix
get_lower_tri<-function(cormat) {
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}
#
# Get upper triangle of the correlation matrix
get_upper_tri <- function(cormat) {
  cormat[lower.tri(cormat)] <- NA
  return(cormat)
}
#
reorder_cormat <- function(cormat) {
  # Use correlation between variables as distance
  dd <- as.dist((1-cormat) / 2)
  hc <- hclust(dd)
  cormat <- cormat [hc$order, hc$order]
}


# install.packages("reshape2")
library (reshape2)
# install.packages("ggplot2")
library (ggplot2)
# install.packages("ggmap")
library (ggmap)


corr_sub <- rate_spdf@data [ c ("Grocery", "Restaurant", "Pct_Forest", "Med_HomeIn", "Renter_Cou", "Med_HomeVa", "EB_Rate")]
cormax <- round (cor(corr_sub), 2)
upper_tri <- get_upper_tri (cormax)
melted_cormax <- melt (upper_tri, na.rm = TRUE)
cormax <- reorder_cormat (cormax)
upper_tri <- get_upper_tri (cormax)
melted_cormax <- melt (upper_tri, na.rm = TRUE)
ggheatmap <- ggplot (melted_cormax, aes (Var2, Var1, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2 (low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1,1), space = "Lab", name = "Pearson\nCorrelation") +
  theme_minimal() + # minimal theme
  theme (axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1)) +
  coord_fixed()
print (ggheatmap)
ggheatmap +
  geom_text (aes (Var2, Var1, label = value), color = "black", size = 4) +
  theme (
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c (1, 0),
    legend.position = c (0.6, 0.7),
    legend.direction = "horizontal") +
  guides (fill = guide_colorbar (barwidth = 7, barheight = 1, title.position = "top", title.hjust = 0.5))


