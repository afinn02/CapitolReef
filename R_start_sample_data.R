install.packages("readxl")
install.packages("dplyr")
install.packages("openxlsx")

library(readxl)
library(dplyr)
library(openxlsx)

file_path <- file.path("CapitolReef", "PhotoWildlifeData_UMichDataShare_12042023.xlsx")
sheet_names <- excel_sheets(file_path)
all_dataframes <- list()
for (sheet in sheet_names) {
  df <- read_excel(file_path, sheet = sheet)
  all_dataframes[[sheet]] <- df
}


