# Import libraries
library(rmarkdown)
library(data.table)
library(shiny)
library(tinytex)


# Import functions 
source("helpers/Functions.R")

##############################################################
# Input parameters for the automatic .Rmd file 
# Set values 
##############################################################
# Dataset warpbreaks, two-factorial 
filename <- "warpbreaks.csv"
path = paste(file.path("Datasets"), sep="/", filename)
decimal <- "."
data <- fread(path, header = "auto", sep ="auto", dec = decimal, 
              encoding ="UTF-8", data.table = FALSE, na.strings = "")
## Selection of variables
vars1 <- c("breaks", "wool", "tension") 
## Model Information
model <- "breaks ~ wool+tension \n wool \n A"
cont_crit <- "Liberal" # or Conservative Liberal 


# params = list(
#   filename = filename,
#   decimal = decimal,
#   data = data,
#   vars1 = vars1,
#   model = model,
#   cont_crit = cont_crit
# )
# 
# msyntax <- TRUE
# model <- params$model
# modelsplit <- unlist(strsplit(model, split="\n"))
# modelsplit <- gsub(" ", "", modelsplit, fixed = TRUE)
# modelsplit <- modelsplit[modelsplit != ""]
# 
# rm(params)

##############################################################
# Run parametric, automatic .Rmd file 
##############################################################
rmarkdown::render("report.Rmd", params = list(
  filename = filename,
  decimal = decimal,
  data = data,
  vars1 = vars1,
  model = model,
  cont_crit = cont_crit 
))

############################################## end of program ########################################################################





