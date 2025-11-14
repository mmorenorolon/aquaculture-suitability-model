# Identifying Suitable Marine Aquaculture Areas 
This repository contains tools to identify and map suitable areas for marine aquaculture development along the U.S. West Coast. Suitability is determined based on species-specific ranges of sea surface temperature (SST) and ocean depth. The workflow includes a custom function that ingests user-defined environmental thresholds and produces a map of suitable area across Exclusive Economic Zone (EEZ) regions.

## Table of Contents
- [Overview](#overview)
- [Repository Structure](#repositorystructure)
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
└─── README.md
└─── qmd/Rmd/Proj files
└─── aquaculture_analysis.qmd # Name your file a title that is representative of your analysis!
|   .gitignore
    └───data
        └─── wc_regions_clean.shp
        └─── depth.tif
        └─── average_annual_sst_2008.tif
        └─── average_annual_sst_2009.tif
        └─── average_annual_sst_2010.tif
        └─── average_annual_sst_2011.tif
        └─── average_annual_sst_2012.tif
```

## Installation
Clone the repository and install any required R packages:
```
git clone https://github.com/mmorenorolon/aquaculture-suitability-model.git
cd aquaculture-suitability-model
```

In R:
```
install.packages(c("tidyverse", "sf", "terra", "tmap"))
```

## Usage
To run the project, source the main script and call the suitability function:
```
source("R/suitability_function.R")

result_map <- suitability_map(
  min_sst = 10,
  max_sst = 18,
  min_depth = -50,
  max_depth = -5,
  species = "Pacific Oyster"
)
```
This returns a mapped object showing suitable EEZ areas for the specified species.

## Data Access
Environmental datasets (SST and depth) and EEZ shapefiles must be downloaded separately or placed in the data/ directory.
Links to data sources (update with actual links):

SST:

Depth (Bathymetry):

U.S. West Coast EEZ boundaries:

Ensure file paths in the scripts match your local structure.

## Contributors
Melannie Moreno Rolón

## Ackowledgements
This project was completed as part of the Environmental Data Science curriculum at UC Santa Barbara. SST, depth, and EEZ datasets were provided through course materials. Thanks to instructors and TAs for guidance on spatial analysis in R.

## License
This repository is distributed under the MIT License.
