# BizData Club R Training and Challenges

## About
Welcome to the BizData Club repository! This initiative is designed to help students learn data analytics and R programming through practical, real-world challenges. Our curriculum combines foundational R programming skills with applied data analysis projects focused on contemporary issues like climate change.

## Repository Structure
- `/tutorials` - R training materials covering:
  - Topic 1: Introduction to R
  - Topic 2: Data Visualization with ggplot2
  - Topic 3: Data Access and Manipulation
  - Topic 4: Statistical Analysis
  - Topic 5: Data Tables
  - Topic 6: OLS Regression
  - Topic 8: Climate Data Analysis

- `/challenges` - Real-world data analysis challenges
  - Challenge 1: Understanding the Climate Crisis

## Getting Started

### Prerequisites
1. Install R from [CRAN](https://cran.r-project.org/)
2. Install RStudio Desktop from [Posit](https://posit.co/download/rstudio-desktop/)

### Required R Packages
```R
packages <- c(
    "ggplot2",    # Data visualization
    "data.table", # Data manipulation
    "dplyr",      # Data manipulation
    "readxl",     # Excel file reading
    "lattice",    # Visualization
    "MASS",       # Statistical functions
    "quantmod",   # Financial data
    "tm",         # Text mining
    "wordcloud"   # Text visualization
)

# Install packages if not already installed
new.packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
```

## Challenge 1: Understanding the Climate Crisis

### Overview
A three-month data analysis project focusing on climate change data. Students will:
- Learn R programming fundamentals
- Collect and analyze climate data
- Create data visualizations
- Present findings and recommendations

### Project Timeline
1. Month 1: Data Collection and Initial Analysis
   - R basics
   - Climate data understanding
   - Data collection and cleaning

2. Month 2: In-Depth Analysis and Visualization
   - Advanced R programming
   - Emissions analysis
   - Country-specific analysis
   - Data visualization

3. Month 3: Report Preparation and Presentation
   - Findings synthesis
   - Report writing
   - Presentation creation

### Data Sources
- [NASA Earth Data](https://www.earthdata.nasa.gov/learn/find-data)
- [World Bank Climate Data](https://data.worldbank.org/topic/19)
- [IPCC Data](https://www.ipcc-data.org/observ/ddc_co2.html)
- [UK Met Office](https://www.metoffice.gov.uk/research/climate/maps-and-data/uk-and-regional-series)

## Contributing
This is an educational repository maintained by Bangor Business School. If you'd like to contribute or suggest improvements, please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
- Bangor Business School
- BizData Club Team
- All contributing students and educators

## Contact
For questions or support, please [raise an issue](../../issues) in this repository.
