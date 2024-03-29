# Load the required libraries
library(shiny)
library(ggplot2)
library(readr)
library(dplyr)
library(tidyr)
library(shinydashboard)
library(DT)
library(scales)
library(plotly)
library(maps)
library(mapdata)
library(ggthemes)
library(RColorBrewer)
library(cowplot)
library(mapproj)
library(jsonlite)

# Load the data set
source("utilities/parse_data.R")
data1 <- parse_data("data/degrees-that-pay-back.csv")
data2 <- parse_data("data/salaries-by-region.csv")
data3 <- parse_data("data/salaries-by-college-type.csv")
