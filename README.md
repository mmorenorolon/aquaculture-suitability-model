# Identifying Suitable Marine Aquaculture Areas 
This repository contains tools to identify and map suitable areas for marine aquaculture development along the U.S. West Coast. Suitability is determined based on species-specific ranges of sea surface temperature (SST) and ocean depth. The workflow includes a custom function that ingests user-defined environmental thresholds and produces a map of suitable area across Exclusive Economic Zone (EEZ) regions.

## Table of Contents
- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Contributors](#contributors)
- [Acknowledgements](#acknowledgements)
- [License](#license)

## Overview
This project evaluates which U.S. West Coast EEZ regions are most suitable for marine aquaculture, focusing on several oyster species and one species of choice. Suitability is calculated by filtering SST and depth rasters based on user-defined ranges. 
A generalizable function is provided that:

- Accepts minimum/maximum SST, minimum/maximum depth, and a species name

- Calculates the suitable area within each EEZ

- Outputs a map with EEZ regions colored by the proportion of suitable habitat

- Automatically incorporates the species name into the title

This workflow supports reproducible spatial analysis and species-specific suitability assessments for aquaculture planning.

## Repository Structure 
```
aquaculture-suitability-model
│   .gitignore
│   .Rhistory
│   aquaculture-suitability-model.Rproj
│   aquaculture-suitability-workflow.pdf
│   aquaculture-suitability-workflow.qmd
│   LICENSE
│   README.md
│
├───data
│       average_annual_sst_2008.tif
│       average_annual_sst_2009.tif
│       average_annual_sst_2010.tif
│       average_annual_sst_2011.tif
│       average_annual_sst_2012.tif
│       depth.tif
│       wc_regions_clean.dbf
│       wc_regions_clean.prj
│       wc_regions_clean.shp
│       wc_regions_clean.shx
│
├───figures
│       oyster_map.pdf
│       scallop_map.pdf
│
└───R
        suitability_function.R
```

## Installation
Clone the repository and install any required R packages:
```
git clone https://github.com/mmorenorolon/aquaculture-suitability-model.git
cd aquaculture-suitability-model
```

In R:
```
install.packages(c("tidyverse", "sf", "terra", "tmap", "kableExtra", "here", "dplyr", "testthat"))
```

## Usage
To run the project, source the main script and call the suitability function:
```
# Example:
source("R/suitability_function.R")

result <- map_suitability(
  tmin = 11,
  tmax = 30,
  dmin = -70,
  dmax = 0,
  species_name = "Oyster"
)

# Outputs
result$map     # tmap object of suitable areas
result$table   # formatted suitability table
```
This returns a mapped object showing suitable EEZ areas for the specified species.

## Data Access
Environmental datasets (SST and depth) and EEZ shapefiles must be downloaded separately or placed in the data/ directory.

**NOAA Sea Surface Temperature (SST)**

National Oceanic and Atmospheric Administration (NOAA). 2024. 5km Daily Global Satellite Sea Surface Temperature Anomaly v3.1. Coral Reef Watch Program. Average annual SST rasters for 2008–2012 were used in this analysis.
Data files: `average_annual_sst_2008.tif`, `average_annual_sst_2009.tif`, `average_annual_sst_2010.tif`, `average_annual_sst_2011.tif`, `average_annual_sst_2012.tif`.
Available at: https://coralreefwatch.noaa.gov/product/5km/

**GEBCO Bathymetry**

General Bathymetric Chart of the Oceans (GEBCO). 2023. GEBCO Compilation Group: GEBCO 2023 Grid. British Oceanographic Data Centre.
Data file: `depth.tif`.
Available at: https://www.gebco.net/

**Exclusive Economic Zones (EEZ)**

Flanders Marine Institute (VLIZ). 2023. Maritime Boundaries Geodatabase: Exclusive Economic Zones (EEZ), version 12. MarineRegions.org.
Data file: `wc_regions_clean.shp`.
Available at: https://www.marineregions.org/

Ensure file paths in the scripts match your local structure.

## Contributors
Melannie Moreno Rolón

## Acknowledgements
This project was completed as part of the Environmental Data Science curriculum at UC Santa Barbara. SST, depth, and EEZ datasets were provided through course materials. Thanks to instructors and TAs for guidance on spatial analysis in R.

## License
This repository is distributed under the MIT License.
