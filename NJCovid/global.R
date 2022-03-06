library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)
library(shinydashboard)
library(DT)
library(leaflet)
library(leaflet.extras)
library(ggpubr)
library(plotly)

#if you create a helpers file
#source('./helpers.R')

#load csv files
countiesCovid = read.csv(file = './countiesCovid.csv')
countiesCurrent = read.csv(file = './countycovid312022.csv')
countyDemo = read.csv(file = './countyDemo.csv')
njCovid = read.csv(file = './njCovid.csv')

merged_df = merge(x=counties_current, y=countyDemo, by='county', all.x=TRUE) %>%
  mutate(vaxInitiatedRatio = vaxInitiatedRatio * 100) %>%
  mutate(vaxCompletedRatio = vaxCompletedRatio * 100) %>%
  mutate(vaxAddDoseRatio = vaxAddDoseRatio * 100) %>%
  mutate(totalCasesRatio = totalCasesRatio * 1000) %>%
  mutate(totalDeathsRatio = totalDeathsRatio * 1000)

#demoChoices = c(countyDemo$hsGrad, countyDemo$bachDeg, countyDemo$noInsurance,
                #countyDemo$medianIncome, countyDemo$poverty, countyDemo$popDensity)

demoChoices = names(merged_df)

demoMenu = c('Percent High School Graduate' = 'hsGrad',
             'Percent Bachelor\'s Degree' = 'bachDeg',
             'Percent with No Health Insurance' = 'noInsurance',
             'Median Household Income' = 'medianIncome',
             'Percent Living in Poverty' = 'poverty',
             'Population Density' = 'popDensity'
            )

statMenu = c('Infection Rate' = 'infectionRate',
             'Percent Initiated Vaccination' = 'vaxInitiatedRatio',
             'Percent Fully Vaccinated' = 'vaxCompletedRatio',
             'Percent Fully Vaccinated + Booster' = 'vaxAddDoseRatio',
             'Total Cases per 1,000 People'= 'totalCasesRatio',
             'Total Deaths per 1,000 People' = 'totalDeathsRatio'
            )