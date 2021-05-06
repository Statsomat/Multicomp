# Import libraries
library(rmarkdown)
library(data.table)
library(shiny)


# Import functions 
source("helpers/Functions.R")

##############################################################
# Input parameters for the automatic .Rmd file 
# Set values 
##############################################################
filename <- "recovery.csv"
path = paste(file.path("Datasets"), sep="/", filename)
decimal <- "."
data <- fread(path, header = "auto", sep ="auto", dec = decimal, 
              encoding ="UTF-8", data.table = FALSE, na.strings = "")
## Selection of variables
vars1 <- c("blanket", "minutes") 
## Model Information
model <- "minutes ~ blanket \n blanket \n b0"
## Criterium to identify continuous vs discrete variables 
cont_crit <- "Liberal" # or Conservative 



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




# #install.packages("ISwR")
# library(ISwR)
# data<-thuesen
# filename <- "recovery.csv"
# decimal <- "."
# vars1 <- c("blood.glucose", "short.velocity")
# model <- "blood.glucose ~ short.velocity \n short.velocity \n b0"
# #data <- fread(filename, header = "auto", sep ="auto", dec = decimal,
# #encoding ="UTF-8", data.table = FALSE, na.strings = "")
# ## Selection of variables
# #vars1 <- c("blanket", "minutes")
# ## Model Information
# #model <- "minutes ~ blanket \n blanket \n b0"
# ## Criterium to identify continuous vs discrete variables
# cont_crit <- "Liberal" # or Conservative

