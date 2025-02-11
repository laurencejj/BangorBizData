

## check packages are installed
list.of.packages <- c("data.table", "readxl", "ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos = "http://cran.us.r-project.org")

suppressWarnings({
  library(data.table)
  library(readxl)
  library(ggplot2)
})

# read in data on covid cases
emissions_data_wide = data.table(read_xlsx("D:/Users/Laurence/Google Drive/BBS/Admin/BizData club/Tutorials/World Bank CO2/P_Data_Extract_From_World_Development_Indicators.xlsx"))

# turn it from wide data format to long data
emissions_data_long = melt(emissions_data_wide, id.vars = colnames(emissions_data_wide)[1:4])

# extract year
emissions_data_long[, year := as.numeric(substr(variable, 1, 4))]

# ensure the co2 values are numeric
emissions_data_long[, value := as.numeric(value)]

# rename variables for column names
emissions_data_long[`Series Code` == "EN.ATM.CO2E.PC", `Series Name` := "CO2_emissions_per_person"]
emissions_data_long[`Series Code` == "EN.CO2.ETOT.ZS", `Series Name` := "Co2_emissions_electic_heat"]

# drop any rows that don't have a series code
emissions_data_long = emissions_data_long[!is.na(`Series Code`)]

# rename columns
setnames(emissions_data_long, old = c("Series Name", "Series Code", "Country Name", "Country Code"),
         new = c("series", "code", "country", "country_code"))

# reshape data so that each variable is in its own column
emissions_data = dcast(emissions_data_long, country + country_code + year ~ series)

## graph relation between CO2 per person and the percentage used for heat
ggplot(emissions_data[country %in% c("Albania", "Finland", "Italy", "Sweden")]) +
  geom_point(aes(x=Co2_emissions_electic_heat, y=CO2_emissions_per_person, colour=country))

## are emissions going up or down?
ggplot(emissions_data[country %in% c("Albania", "Finland", "Italy", "Sweden")]) +
  geom_point(aes(x=year, y=CO2_emissions_per_person, colour=year)) +
  facet_wrap(~ country, scales = "free", ncol=2)
