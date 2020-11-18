#Session 12 Exercise

# Using our knowledge of R, we are going to try to answer the following two questions:
  
# What species of predator is the most abundant and has this changed through time?

# Does the number of eggs predated increase with the total number of predators for all species laying nests?

#load libraries ----

library(rvest)
library(readr)
library(dplyr)
library(janitor)

#load data ----
webpage <- read_html("https://www.pwrc.usgs.gov/bbl/manual/speclist.cfm")

tbls <- html_nodes(webpage, "table") %>% 
  html_table(fill = TRUE)

species <- tbls[[1]] %>% 
  clean_names() %>% 
  select(alpha_code, common_name) %>% 
  mutate(alpha_code = tolower(alpha_code))

