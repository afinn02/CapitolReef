#Preinstalls for script
install.packages("readxl")
install.packages("dplyr")
install.packages("openxlsx")
install.packages("RColorBrewer")
install.packages('viridis')

#Necessary libraries
library(readxl)
library(dplyr)
library(openxlsx)
library(RColorBrewer)
library(viridis)


#file_path <- file.path("PhotoWildlifeData_UMichDataShare_12042023.xlsx")
user_file_path <- readline(prompt = "Enter the file path: ")
sheet_names <- excel_sheets(file_path)
all_dataframes <- list()
for (sheet in sheet_names) {
  df <- read_excel(file_path, sheet = sheet)
  all_dataframes[[sheet]] <- df
}

#Set up the different data frames from each of the main frames that we read in
photoData <- all_dataframes[['PhotoData']]
siteLocations <- all_dataframes[['SiteLocations']]
metaData <- all_dataframes[['Metadata']]

#Barplot of the different animals seen at each location:
unique_species <- unique(photoData$Species1)
num_colors <- length(unique_species)
palette <- viridis(n = num_colors)
species_color_vector <- palette[as.factor(photoData$Species1)]
#species_color_vector <- species_colors[as.factor(photoData$Species1)]
barplot(table(photoData$Species1),
        xlab = "Species1",
        ylab = "Frequency",
        main = "Total Number of Species Observed",
        col = species_color_vector)
#legend('topright', legend = unique_species, fill = species_color_vector)

       