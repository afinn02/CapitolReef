#Preinstalls for script
install.packages("readxl")
install.packages("dplyr")
install.packages("openxlsx")
install.packages("RColorBrewer")
install.packages('viridis')
install.packages("ggplot2")

#Necessary libraries
library(readxl)
library(dplyr)
library(openxlsx)
library(RColorBrewer)
library(viridis)
library(ggplot2)


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

#Barplot of the overall count of animals
photoData$Species1 <- factor(photoData$Species1, levels = names(sort(table(photoData$Species1), decreasing = TRUE)))
ggplot(photoData, aes( y= Species1)) +
  geom_bar(fill = palette) +
  labs(title = "Overall Count of Species Recorded", y = "Species", x = "Count")


