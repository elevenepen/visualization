library(ggplot2)
library(tidyr)
library(clipr)
library(sf)
library(stars)
library(cowplot)

#panggil data shp
indo_shp <- st_read("indo.shp")

#DJF
#input data
djf <- read_clip_tbl()

#plot with ggplot
sig_djf <- ggplot()+
  geom_raster(aes(x=longitude, y=latitude, fill = r), data = djf)+
  scale_fill_viridis_c(name = "correlation", direction = -1)+
  geom_sf(fill='transparent', data = indo_shp)+
  theme(legend.position = "none")+
  labs(title = "a. DJF")
sig_djf

#MAM
#input data
mam <- read_clip_tbl()
#plot with ggplot
sig_mam <- ggplot()+
  geom_raster(aes(x=longitude, y=latitude, fill = r), data = mam)+
  scale_fill_viridis_c(name = "correlation", direction = -1)+
  geom_sf(fill='transparent', data = indo_shp)+
  theme(legend.position = "none")+
  labs(title = "b. MAM")
sig_mam

#JJA
#input data
jja <- read_clip_tbl()
#plot with ggplot
sig_jja <- ggplot()+
  geom_raster(aes(x=longitude, y=latitude, fill = r), data = jja)+
  scale_fill_viridis_c(name = "correlation", direction = -1)+
  geom_sf(fill='transparent', data = indo_shp)+
  theme(legend.position = "none")+
  labs(title = "c. JJA")
sig_jja

#SON
#input data
son <- read_clip_tbl()
#plot with ggplot
sig_son <- ggplot()+
  geom_raster(aes(x=longitude, y=latitude, fill = r), data = son)+
  scale_fill_viridis_c(name = "correlation", direction = -1)+
  geom_sf(fill='transparent', data = indo_shp)+
  theme(legend.position = "none")+
  labs(title = "d. SON")
sig_son

legend_b <- get_legend(
  sig_jja + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = "right"))


plot_grid(sig_djf, sig_mam, legend_b)

legend_c <- get_legend(
  sig_jja + 
    guides(color = guide_legend(nrow = 1)) +
    theme(legend.position = "bottom"))
plot_grid(sig_jja, sig_son, legend_c)

