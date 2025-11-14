##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                                          --
## ASSESSING SUITABLE AREAS FOR AQUACULTURE FOR OYSTERS AND THE CA YELLOWTAIL IN WESTERN Us
##                                                                                          --
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Import libraries
library(ARTofR)
library(terra)
library(sf)
library(here)

#We will use average annual sea surface temperature (SST) from the years 2008 to 2012 to characterize the average sea surface temperature within the region. The data we are working with was originally generated from NOAA’s 5km Daily Global Satellite Sea Surface Temperature Anomaly v3.1.

sst_2008 <- rast(here('data', 'average_annual_sst_2008.tif'), quiet = T)
sst_2009 <- rast(here('data', 'average_annual_sst_2009.tif'), quiet = T)
sst_2010 <- rast(here('data', 'average_annual_sst_2010.tif'), quiet = T)
sst_2011 <- rast(here('data', 'average_annual_sst_2011.tif'), quiet = T)
sst_2012 <- rast(here('data', 'average_annual_sst_2012.tif'), quiet = T)

# California yellowtail fish (species of choice) - Seriola 