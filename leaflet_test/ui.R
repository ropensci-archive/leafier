
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

titlePanel("Sweet Bike Lanes for Brissy")

shinyUI(fluidPage(
  
leafletOutput ("plot")

))
