# ookla_did

## Overview
This repository contains a Difference-in-Differences (DiD) analysis using geospatial internet speed data from Ookla. The analysis focuses on estimating the impact of specific interventions or events on internet speed across districts in Peru. The project leverages advanced methodologies, including Callaway and Sant’Anna's (2020) staggered DiD approach, and includes both data preprocessing and visualization.

## Repository Structure
The repository is organized into the following main folders:

### 1. `OOKLA_DATA`
This folder is the core of the repository and includes the following components:
- **`codes/`**: Contains scripts for preprocessing Ookla geospatial data, generating clean datasets, and performing visual and statistical analysis. Key processes include:
  - Data cleaning and transformation.
  - Mapping internet speed by districts using **Folium** for geospatial visualization.
  - A Jupyter Notebook implementing Callaway and Sant’Anna's (2020) staggered DiD estimation method.

- **`input/`**: Stores raw data files used for the analysis:
  - Geospatial internet speed data downloaded from Ookla.
  - District and province boundary shapefiles for Peru, which are used to map Ookla's grid data to specific districts.

- **`output/`**: Contains cleaned datasets and exported data frames generated from preprocessing scripts and Jupyter Notebooks.

### 2. Additional Notes
The data includes:
- Ookla's geospatial data limited to grids within Peru.
- Boundary shapefiles used to identify the districts where each grid belongs.

The repository is designed to facilitate reproducible analysis, from data preprocessing to visualization and statistical estimation.

## Methodology
The analysis uses the Callaway and Sant’Anna (2020) staggered DiD approach to estimate treatment effects in a setting with multiple treatment periods. The approach is implemented in Python and is particularly suited for evaluating the impact of interventions over time and across regions.

## Visualization
District-level internet speed visualizations are generated using **Folium**, showcasing geographic disparities and trends in speed improvements.

## Usage
1. Clone this repository.
2. Ensure the required Python libraries are installed (see `requirements.txt` for dependencies).
3. Navigate through the folders:
   - Use `codes/` for preprocessing and analysis.
   - Place raw data in `input/`.
   - Export results to `output/`.

## Requirements
- Python 3.10
- Key libraries: `folium`, `pandas`, `numpy`, `statsmodels`, `geopandas`, among others.

## Acknowledgements
- Ookla for providing geospatial internet speed data.
- Callaway and Sant’Anna (2020) for their staggered DiD methodology.

---
