#' ---
#' title: "Sparkman et al analysis"
#' author: "Your name here"
#' output: pdf_document
#' ---
#'

#' To compile into a pdf report in RStudio, File -> Compile Report. . .
#'

#' Packages
#'
#' Read in the data:
#'
#'
dat <- read.csv("./../data/41467_2022_32412_MOESM4_ESM.csv")
dat$perceived_concern <- dat$GRID_GTS1_1_GTS1

#' Make the plot: 

#' Create variables for regression 
#' 

dat$female <- dat$resp_gender == 2
dat$college_grad <- dat$USEDU3 > 9

#' Run regression and store results:
#' 

my_reg1 <- estimatr::lm_robust(perceived_concern ~ female + college_grad, data = dat)

#' Output the results in a table: 

modelsummary::modelsummary(list(my_reg1))

