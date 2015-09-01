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
admin0 <- readOGR("mkdata/geojson/charmingly-inaccurate/geojson/admin0_poly.json", "OGRGeoJSON", stringsAsFactors=FALSE)
admin1 <- readOGR("mkdata/geojson/charmingly-inaccurate/geojson/admin1_poly.json", "OGRGeoJSON", stringsAsFactors=FALSE)
linework[["charmingly_inaccurate"]][["admin0"]] <- admin0
linework[["charmingly_inaccurate"]][["admin1"]] <- admin1
linework[["charmingly_inaccurate"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["charmingly_inaccurate"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["elmer_casual"]] <- list()
admin0 <- readOGR("mkdata/geojson/elmer-casual/geojson/admin0_polygons.json", "OGRGeoJSON", stringsAsFactors=FALSE)
admin1 <- readOGR("mkdata/geojson/elmer-casual/geojson/admin1_polygons.json", "OGRGeoJSON", stringsAsFactors=FALSE)
linework[["elmer_casual"]][["admin0"]] <- admin0
linework[["elmer_casual"]][["admin1"]] <- admin1
linework[["elmer_casual"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["elmer_casual"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["geo_metro"]] <- list()
admin0 <- readOGR("mkdata/geojson/geo-metro/geojson/Admin0_polygons.json", "OGRGeoJSON", stringsAsFactors=FALSE)
admin1 <- readOGR("mkdata/geojson/geo-metro/geojson/Admin1_polygons.json", "OGRGeoJSON", stringsAsFactors=FALSE)
linework[["geo_metro"]][["admin0"]] <- admin0
linework[["geo_metro"]][["admin1"]] <- admin1
linework[["geo_metro"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["geo_metro"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["times_approximate"]] <- list()
admin0 <- readOGR("mkdata/geojson/times-approximate/geojson/admin0_polygons.json", "OGRGeoJSON", stringsAsFactors=FALSE)
admin1 <- readOGR("mkdata/geojson/times-approximate/geojson/admin1_polygons.json", "OGRGeoJSON", stringsAsFactors=FALSE)
linework[["times_approximate"]][["admin0"]] <- admin0
linework[["times_approximate"]][["admin1"]] <- admin1
linework[["times_approximate"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["times_approximate"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["twenty_seventy"]] <- list()
admin0 <- readOGR("mkdata/geojson/twenty-seventy/geojson/admin0_poly.json", "OGRGeoJSON", stringsAsFactors=FALSE)
admin1 <- readOGR("mkdata/geojson/twenty-seventy/geojson/admin1_poly.json", "OGRGeoJSON", stringsAsFactors=FALSE)
linework[["twenty_seventy"]][["admin0"]] <- admin0
linework[["twenty_seventy"]][["admin1"]] <- admin1
linework[["twenty_seventy"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["twenty_seventy"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["wargames"]] <- list()
admin0 <- readOGR("mkdata/geojson/wargames/geojson/admin0_polygons.json", "OGRGeoJSON", stringsAsFactors=FALSE)
admin1 <- readOGR("mkdata/geojson/wargames/geojson/admin1_polygons.json", "OGRGeoJSON", stringsAsFactors=FALSE)
linework[["wargames"]][["admin0"]] <- admin0
linework[["wargames"]][["admin1"]] <- admin1
linework[["wargames"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["wargames"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["moriarty"]] <- list()
admin0 <- readOGR("mkdata/geojson/moriarty-hand/geojson/Admin_0_Polygons.geojson", "OGRGeoJSON", stringsAsFactors=FALSE)
admin1 <- readOGR("mkdata/geojson/moriarty-hand/geojson/Admin_1_Polygons.geojson", "OGRGeoJSON", stringsAsFactors=FALSE)
linework[["moriarty"]][["admin0"]] <- admin0
linework[["moriarty"]][["admin1"]] <- admin1
linework[["moriarty"]][["admin0_fortified"]] <- fortify_and_merge(admin0)
linework[["moriarty"]][["admin1_fortified"]] <- fortify_and_merge(admin1)

linework[["weekend"]] <- list()
admin0 <- readOGR("mkdata/geojson/weekend-update/geojson/Polygons.geojson", "OGRGeoJSON", stringsAsFactors=FALSE)
linework[["weekend"]][["admin0"]] <- admin0
linework[["weekend"]][["admin0_fortified"]] <- fortify_and_merge(admin0)

devtools::use_data(linework, overwrite=TRUE, compress="xz")
