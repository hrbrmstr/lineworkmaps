#' Retrieve a linework map as a regular or fortified \code{SpatialPolygonsDataFrame}
#'
#' \href{http://www.projectlinework.org/}{Project Linework} is
#' \emph{"A library of handcrafted vector linework for cartography, each
#' designed in a unique aesthetic style. They are meant to break us away from
#' default line paths that we so often rely on by providing more
#' visually-interesting alternatives."}
#'
#' @param linework_set one of \code{"charmingly_inaccurate"}, \code{"elmer_casual"},
#'        \code{"geo_metro"}, \code{"times_approximate"}, \code{"twenty_seventy"},
#'        \code{"wargames"}
#' @param admin_level either \code{0} or \code{1} for the shapefile admin level
#' @param fortified \code{TRUE} if the function should return a "fortified"
#'        object (i.e. ready for use with \code{ggplot})
#' @return \code{SpatialPolygonsDataFrame} or regular \code{data.frame}
#' @seealso \href{http://www.projectlinework.org/}{Project Linework} for more
#'          information about the shapefiles
#' @export
#' @note Unfortunately, there was no regulation within Project Linework to
#'       standardize on the format for the shapefile data columns, so you'll
#'       have to inspect the \code{@@data} element of the non-fortified
#'       returned object or the \code{str} of the fortified returned object
#'       to get an idea for fields that you can subset on. You can perform
#'       this inspection with a call to \code{\link[linework]{lineworks}}.
#' @examples
#' library(sp)
#'
#' # plot admin1 polygons for Elmer Casual (the defaults)
#' plot(linework_map())
#'
#' # plot the continental United States "Wargames" style
#' library(ggplot2)
#' library(ggthemes)
#' wargames <- linework_map("wargames", fortified=TRUE)
#' us <- wargames[wargames$iso_a2=="US" & !wargames$code_hasc %in% c("US.HI", "US.AK"),]
#' ggplot(us) +
#'   geom_map(map=us, aes(x=long, y=lat, map_id=id)) +
#'   coord_map(project="albers", lat0=37.5, lat1=29.5) +
#'   theme_map()
#'
#' # fancier example
#' elmer <- linework_map("elmer_casual", fortified=TRUE)
#' us <- elmer[elmer$COUNTRY=="US" & elmer$Name != "Alaska",]
#' gg <- ggplot()
#' gg <- gg + geom_map(data=us, map=us,
#'                     aes(x=long, y=lat, map_id=id),
#'                     color="#939598", fill="#d1d2d4", size=0.5)
#' gg <- gg + coord_map(project="albers", lat0=37.5, lat1=29.5)
#' gg <- gg + labs(title="Elmer Casual")
#' gg <- gg + theme_map()
#' gg <- gg + theme(plot.title=element_text(size=16))
#' gg
linework_map <- function(linework_set="elmer_casual",
                         admin_level=1,
                         fortified=FALSE) {

  if (!linework_set %in% c("charmingly_inaccurate", "elmer_casual",
                           "geo_metro", "times_approximate",
                           "twenty_seventy", "wargames")) {
    stop("Invalid 'linework_set' specified", call.=FALSE)
  }

  if (!admin_level %in% 0:1) {
    stop("'admin_level' must be either 0 or 1", call.=FALSE)
  }

  admin_level <- sprintf("admin%d", admin_level)

  if (fortified) {
    admin_level <- sprintf("%s_fortified", admin_level)
  }

  return(linework[[linework_set]][[admin_level]])

}

#' Return vector of available linework shapes and optionally print verbose
#' description of shapfile data elements.
#'
#' @param verbose return information about the structure of the additional
#'        shapefile data? (Default: \code{FALSE} - just return names of
#'        lineworks.)
#' @return character vector
#' @export
lineworks <- function(verbose=FALSE) {

  if (verbose) {
    for (x in sort(names(linework))) {
      for (a in c("admin0", "admin1")) {
        cat(sprintf("\n%s - %s\n\n", x, a))
        (str(linework[[x]][[a]]@data))
      }
    }
    cat("\n")
  }

  return(sort(names(linework)))

}


#' @title Project Linework spatial & fortified objects
#'
#' @docType data
#' @keywords datasets
#' @name linework
#'
#' @usage data(linework)
#' @note Last updated 2015-07-20.
#' @format A list with six named objects and 24 named nested objects
NULL
