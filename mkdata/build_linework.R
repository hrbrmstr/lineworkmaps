library(sp)
library(rgdal)
library(ggplot2)

fortify_and_merge <- function(shp) {
  tmp <- fortify(shp)
  dat <- shp@data
  dat$id <- rownames(shp@data)
  merge(tmp, dat, by="id")
}

linework <- list()

linework[["charmingly_inaccurate"]] <- list()
admin0 <- readOGR("mkdata/geojson/charmingly-inaccurate/geojson/admin0_poly.json", "OGRGeoJSON")
admin1 <- readOGR("mkdata/geojson/charmingly-inaccurate/geojson/admin1_poly.json", "OGRGeoJSON")
linework[["charmingly_inaccurate"]][["admin0"]] <- admin0
linework[["charmingly_inaccurate"]][["admin1"]] <- admin1
linework[["charmingly_inaccurate"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["charmingly_inaccurate"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["elmer_casual"]] <- list()
admin0 <- readOGR("mkdata/geojson/elmer-casual/geojson/admin0_polygons.json", "OGRGeoJSON")
admin1 <- readOGR("mkdata/geojson/elmer-casual/geojson/admin1_polygons.json", "OGRGeoJSON")
linework[["elmer_casual"]][["admin0"]] <- admin0
linework[["elmer_casual"]][["admin1"]] <- admin1
linework[["elmer_casual"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["elmer_casual"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["geo_metro"]] <- list()
admin0 <- readOGR("mkdata/geojson/geo-metro/geojson/Admin0_polygons.json", "OGRGeoJSON")
admin1 <- readOGR("mkdata/geojson/geo-metro/geojson/Admin1_polygons.json", "OGRGeoJSON")
linework[["geo_metro"]][["admin0"]] <- admin0
linework[["geo_metro"]][["admin1"]] <- admin1
linework[["geo_metro"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["geo_metro"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["times_approximate"]] <- list()
admin0 <- readOGR("mkdata/geojson/times-approximate/geojson/admin0_polygons.json", "OGRGeoJSON")
admin1 <- readOGR("mkdata/geojson/times-approximate/geojson/admin1_polygons.json", "OGRGeoJSON")
linework[["times_approximate"]][["admin0"]] <- admin0
linework[["times_approximate"]][["admin1"]] <- admin1
linework[["times_approximate"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["times_approximate"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["twenty_seventy"]] <- list()
admin0 <- readOGR("mkdata/geojson/twenty-seventy/geojson/admin0_poly.json", "OGRGeoJSON")
admin1 <- readOGR("mkdata/geojson/twenty-seventy/geojson/admin1_poly.json", "OGRGeoJSON")
linework[["twenty_seventy"]][["admin0"]] <- admin0
linework[["twenty_seventy"]][["admin1"]] <- admin1
linework[["twenty_seventy"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["twenty_seventy"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["wargames"]] <- list()
admin0 <- readOGR("mkdata/geojson/wargames/geojson/admin0_polygons.json", "OGRGeoJSON")
admin1 <- readOGR("mkdata/geojson/wargames/geojson/admin1_polygons.json", "OGRGeoJSON")
linework[["wargames"]][["admin0"]] <- admin0
linework[["wargames"]][["admin1"]] <- admin1
linework[["wargames"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["wargames"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

devtools::use_data(linework, overwrite=TRUE, compress="xz")
