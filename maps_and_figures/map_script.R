# creating maps for scvbi plotbook


library(maptools)

litu <- readOGR("C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures/liriodendron_tulipifera_range.shp")
litumap <- gmap(extent(litu),lonlat=TRUE,type="satellite")


# leaflet ####
library(leaflet)
library(maps)
library(htmlwidgets)
library(maptools)

## for scbi plot
setwd("C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures")

dendro <- read.csv("C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures/dendro_cored_full[sample].csv")
bounds <- map("state", "virginia", fill=TRUE, plot=FALSE)

dendro$tag <- as.character(dendro$tag)

map <- leaflet(data = dendro) %>%
  # setView(-72.14600, 43.82977, zoom = 8) %>% 
  addProviderTiles("CartoDB.Positron", group = "Map") %>%
  addProviderTiles("Esri.WorldTopoMap", group = "Topo") %>% 
  addProviderTiles("Esri.WorldShadedRelief", group = "Relief") %>%
  addMarkers(lng=~lon, lat=~lat, label = ~tag, group = "Trees") %>% 
  addPolygons(data=dendro, groups="Trees",weight=2, fillOpacity = 0) %>%
  addScaleBar(position = "bottomleft") %>%
  addLayersControl(
    baseGroups = c("Map", "Topo", "Relief"),
    overlayGroups = c("Trees", "States"),
    options = layersControlOptions(collapsed = FALSE)
  )

invisible(print(map))
saveWidget(map, file="dendro.html", selfcontained=TRUE)


## for sp range maps
library(rgdal)

litu <- readOGR("C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures/liriodendron_tulipifera_range.shp")

quru <- readOGR("C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures/quercus_rubra_range.shp")

library(sp)
pj84 <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs")
littlelitu2 <- spTransform(littlelitu, pj84)

bounds <- map("usa",fill=TRUE, plot=FALSE)

map <- leaflet() %>%
  # setView(-72.14600, 43.82977, zoom = 8) %>% 
  addProviderTiles("CartoDB.Positron", group = "Map") %>%
  addProviderTiles("Esri.WorldTopoMap", group = "Topo") %>% 
  addProviderTiles("Esri.WorldShadedRelief", group = "Relief") %>%
  #addMarkers(lng=~lon, lat=~lat, label = ~tag, group = "Trees") %>% 
  addMarkers(data=) %>%
  addPolygons(data=litu, weight=2, fillOpacity = 0) %>%
  addPolygons(data=quru, weight=1, color="#115F", fillOpacity = 0) %>%
  addScaleBar(position = "bottomleft") %>%
  addLayersControl(
    baseGroups = c("Map", "Topo", "Relief"),
    overlayGroups = c("Trees", "States"),
    options = layersControlOptions(collapsed = FALSE)
  )

invisible(print(map))

saveWidget(map, file="litumap.html", selfcontained=TRUE)

#you can have multiple addPolygons lines, with either reading in different shapefiles or reading in actual shapes. Be sure to use ?addPolygons to see all the options (as in, fill color, popup, shape, etc).










# convert kmz file to kml ####
#1 first you have to rename the kmz as a zip (bc it's a zipped kml), then unzip it.
fnm <- c("C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures/Quercus_prinus_final.dynglobcurrent3.elev.30000.kmz")

quprkml <- unzip(zipfile = "C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures/Quercus_prinus_final.dynglobcurrent3.elev.30000.kmz", exdir = "C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures")

#2 then you open the kml file in R and convert it to a shapefile
## kml files can be read into R via readOGR, however, the layer variable of the function is specified as what the layer is called within the kml file, which is NOT the same as the file name. The only way to find the layer name is by opening the kml file as a txt and finding what the polygon (in this case) is labeled as.

qupr <- readOGR(dsn=path.expand("C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures"),layer="Quercus_prinus_final.dynglobcurrent3.elev.30000")
writeOGR("C:/Users/mcgregori/Dropbox (Smithsonian)/Github_Ian/SCBI-Plot-Book/maps_and_figures/quercus_prinus_range.shp",driver="ESRI Shapefile",layer=output.shp)




