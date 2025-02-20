% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/linework.R
\name{linework_map}
\alias{linework_map}
\title{Retrieve a linework map as a regular or fortified \code{SpatialPolygonsDataFrame}}
\usage{
linework_map(linework_set = "elmer_casual", admin_level = 1,
  fortified = FALSE)
}
\arguments{
\item{linework_set}{one of \code{"charmingly_inaccurate"}, \code{"elmer_casual"},
\code{"geo_metro"}, \code{"moriarty_hand"}, \code{"times_approximate"},
\code{"twenty_seventy"}, \code{"wargames"}, \code{"weekend_update"}}

\item{admin_level}{either \code{0} or \code{1} for the shapefile admin level}

\item{fortified}{\code{TRUE} if the function should return a "fortified"
object (i.e. ready for use with \code{ggplot})}
}
\value{
\code{SpatialPolygonsDataFrame} or regular \code{data.frame}
}
\description{
\href{http://www.projectlinework.org/}{Project Linework} is
\emph{"A library of handcrafted vector linework for cartography, each
designed in a unique aesthetic style. They are meant to break us away from
default line paths that we so often rely on by providing more
visually-interesting alternatives."}
}
\note{
Unfortunately, there was no regulation within Project Linework to
      standardize on the format for the shapefile data columns, so you'll
      have to inspect the \code{@data} element of the non-fortified
      returned object or the \code{str} of the fortified returned object
      to get an idea for fields that you can subset on. You can perform
      this inspection with a call to \code{\link[linework]{lineworks}}.
}
\examples{
library(sp)

# plot admin1 polygons for Elmer Casual (the defaults)
plot(linework_map())

# plot the continental United States "Wargames" style
library(ggplot2)
library(ggthemes)
wargames <- linework_map("wargames", fortified=TRUE)
us <- wargames[wargames$iso_a2=="US" & !wargames$code_hasc \%in\% c("US.HI", "US.AK"),]
ggplot(us) +
  geom_map(map=us, aes(x=long, y=lat, map_id=id)) +
  coord_map(project="albers", lat0=37.5, lat1=29.5) +
  theme_map()

# fancier example
elmer <- linework_map("elmer_casual", fortified=TRUE)
us <- elmer[elmer$COUNTRY=="US" & elmer$Name != "Alaska",]
gg <- ggplot()
gg <- gg + geom_map(data=us, map=us,
                    aes(x=long, y=lat, map_id=id),
                    color="#939598", fill="#d1d2d4", size=0.5)
gg <- gg + coord_map(project="albers", lat0=37.5, lat1=29.5)
gg <- gg + labs(title="Elmer Casual")
gg <- gg + theme_map()
gg <- gg + theme(plot.title=element_text(size=16))
gg
}
\seealso{
\href{http://www.projectlinework.org/}{Project Linework} for more
         information about the shapefiles
}

