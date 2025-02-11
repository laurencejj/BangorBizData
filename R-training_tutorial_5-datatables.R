

## check packages are installed
list.of.packages <- c("data.table", "ggplot2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos = "http://cran.us.r-project.org")

suppressWarnings({
  library(data.table)
  library(ggplot2)
})

# read in data on covid cases
covid_cases_sample = data.table(read.csv("D:/Users/Laurence/Google Drive/BBS/Admin/BizData club/Tutorials/covid_data.csv"))

# read in data on lockdowns
eu_lockdown_daily = data.table(read.csv("D:/Users/Laurence/Google Drive/BBS/Admin/BizData club/Tutorials/eu_lockdown.csv"))

# convert date from text to date
class(covid_cases_sample$date)
covid_cases_sample[, date := as.Date(date)]
eu_lockdown_daily[, date := as.Date(date)]

# ensure data is ordered
eu_lockdown_daily = eu_lockdown_daily[order(Country, date)]


# we want to know how many covid cases each day in same dataset as the lockdown data
# this function ties the data together and performs what is called a join to link one dataset to another.
eu_lockdown_daily[, covid_cases := covid_cases_sample[eu_lockdown_daily,
                                                      on = .(location==Country, date),
                                                      new_cases_smoothed_per_million]]

# do the lockdowns have an effect on covid cases?
ggplot(eu_lockdown_daily[year(date) %in% c(2020,2021, 2022) & Country %in% c("Austria", "France", "Netherlands", "Spain")]) +  # this specifies what we want in the sample
  geom_point(aes(x=date, y=covid_cases, colour=as.factor(in_lockdown))) +  # this creates the points on the graph
  facet_wrap(~Country, scales = "free_y", ncol = 2) +  # this repeats the graph for each country
  theme_light()   # theme (can be any of a large number)

