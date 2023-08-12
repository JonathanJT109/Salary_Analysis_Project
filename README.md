# Salary Explorer

Welcome to the Salary Explorer! This Shiny app allows you to explore salary trends by region, industry, and college attended. Whether you're a student considering college or simply curious about salary data, the Salary Explorer provides valuable insights.

## Problem Statement

Many students may wonder if the decision to go to college can help them in the long run. The Salary Explorer aims to address this question by visualizing salary data based on various factors.

## Data Description

This study utilizes three datasets obtained from Kaggle. The datasets are available at the following link:

- [Where it Pays to Attend College](https://www.kaggle.com/datasets/wsj/college-salaries)

The first dataset, "degrees-that-pay-back," analyzes the salary of students based on the degree they obtained. The second dataset, "salaries-by-college-type," examines the salary of students based on the type of college they attended.

## Introduction

The goal of the Salary Explorer is to provide users with an interactive interface to explore different aspects of the data. Users can visualize salary trends by region, industry, and college attended. Additionally, the project offers simple-to-understand documentation on the process of building these graphs.

## Getting Started

To run the Salary Explorer locally, follow these steps:

1. Clone the repository from GitHub:
git clone https://github.com/JonathanJT109/Salary_Analysis_Project.git

2. Install the required libraries by running the `global.R` file in R or RStudio. Make sure you have the following libraries installed:
- `shiny`
- `ggplot2`
- `readr`
- `dplyr`
- `tidyr`
- `shinydashboard`
- `DT`
- `scales`
- `plotly`
- `maps`
- `mapdata`
- `ggthemes`
- `RColorBrewer`
- `cowplot`
- `mapproj`

3. Run the app by executing the following command in R or RStudio:
shiny::runApp("path_to_app_directory")


Replace "path_to_app_directory" with the path to the directory where you cloned the repository.

## Additional Resources

For more information about the project, including the source code and documentation, visit the [Salary Explorer GitHub Repository](https://github.com/JonathanJT109/Salary_Analysis_Project).

Feel free to explore the Salary Explorer and gain insights into salary trends based on region, industry, and college attended!
