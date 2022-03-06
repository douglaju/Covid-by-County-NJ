dashboardPage(
  dashboardHeader(
    title = h4(HTML('New Jersey Covid-19<br/>Cases by County'))
  ),
  
  dashboardSidebar(
    sidebarUserPanel('Julianna Douglas',
                     image = './m3.jpg'),
    
    sidebarMenu(
      menuItem('Home', tabName = 'home', icon = icon('home')),
      menuItem('Analysis', tabName = 'analysis', icon = icon('chart-line')),
      menuItem('Raw Data', tabName = 'rawdata', icon = icon('table')),
      menuItem('Conclusion', tabName = 'conclusion', icon = icon('head-side-mask')),
      menuItem('About', tabName = 'about', icon = icon('address-card'))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = 'home',
              h2('The Covid-19 Pandemic in New Jersey'),
              h4('A Demographic Analysis of Covid Statistics by County'),
              fluidRow(
                column(7, br(), img(src = './covid.jpg', width = '100%'),
                       h6('*Data collected from 3/1/2020 - 3/1/2022')),
                column(5, h4("Which demographics are correlated with certain Covid-19 statistics?"),
                       fluidRow(
                         column(6,
                            h5('Demographics:'),
                            h6('-Percent High School Graduate'),
                            h6('-Percent Bachelor\'s Degree'),
                            h6('-Percent with No Health Insurance'),
                            h6('-Median Household Income'),
                            h6('-Percent Living in Poverty'),
                            h6('-Population Density')
                         ),
                         
                         column(6,
                                h5('Covid Statistics:'),
                                h6('-Infection Rate'),
                                h6('-Percent Initiated Vaccination'),
                                h6('-Percent Fully Vaccinated'),
                                h6('-Percent Fully Vaccinated + Booster'),
                                h6('-Total Cases per 1,000 People'),
                                h6('-Total Deaths per 1,000 People')
                                )
                       )
                      )
                  )
              ),
      
      tabItem(tabName = 'analysis',
              h2('Analysis'),
              
              h4('Comparing the Relationship Between Covid-19 Statistics and
                 Demographic Information by County'),
              
              fluidRow(
                column(6, selectizeInput(inputId = "demographic",
                            label = "Demographic:",
                            choices = demoMenu
                            )
                       ),
              
                column(6, selectizeInput(inputId = 'covidstat',
                             label = 'Covid Statistic:',
                             choices = statMenu
                             )
                       )
              ),
              
              h4('Correlation Coefficient:', textOutput('corcoef')),
              
              plotlyOutput("demoPlot"),
              ),

      
      tabItem(tabName = 'rawdata',
              h2('Raw Data'),
              dataTableOutput('rawtable')
              ),
      
      tabItem(tabName = 'conclusion',
              h2('Conclusion'),
              h5('Covid-19 case and death rates increase as the percent of the population with
                 no health insurance increases, whereas case and death rates decrease as
                 median household income increases. Likewise, death rates increase as the
                 percent of the population living in poverty increases, and decrease as the percent
                 of adults who have graduated high school increases.'),
              h5('As the percent of adults who have a Bachelor\'s Degree increases, there is 
                  an increase in the percent of the population who has initiated vaccination,
                  completed vaccination, and received a booster shot. The percent of the population
                 who have received a booster shot increases as the percent of adults who have
                 graduated high school increases and median household income increases, and
                 decreases as the percent of the population living in poverty increases.'),
              
              fluidRow(
                column(6, h4("Very Strong Correlation:"),
                       h5(HTML('Percent Bachelor\'s Degree and Percent Fully Vaccinated + Booster: <b>0.9042</b>')),
                       h5(HTML('Median Household Income and Percent Fully Vaccinated + Booster: <b>0.8406</b>')),
                       
                       br(),
                       
                       h4('No Strong Correlation with Other Categories:'),
                       h5('Population Density'),
                       h5('Infection Rate'),
                       
                       br(),
                       
                       h4('Future Analysis'),
                       h5('Case, death, and vaccination rates by race'),
                       h5('Case, death, and vaccination rates by political affiliation'),
                       h5('Comparing vaccination rates to case and death rates'),
                       h5('Counties in other states or nationally')
                       ),
                
                column(6, h4("Strong Correlation:"),
                       h5(HTML('Percent with No Health Insurance and Total Deaths per 1,000 People: <b>0.7790</b>')),
                       h5(HTML('Percent Bachelor\'s Degree and Percent Fully Vaccinated: <b>0.7619</b>')),
                       h5(HTML('Percent Bachelor\'s Degree and Percent Initiated Vaccination: <b>0.7446</b>')),
                       h5(HTML('Percent High School Graduate and Percent Fully Vaccinated + Booster: <b>0.7201</b>')),
                       h5(HTML('Percent Living in Poverty and Percent Fully Vaccinated + Booster: <b>-0.7055</b>')),
                       h5(HTML('Percent Living in Poverty and Total Deaths per 1,000 People: <b>0.6690</b>')),
                       h5(HTML('Median Household Income and Total Deaths per 1,000 People: <b>-0.6672</b>')),
                       h5(HTML('Percent with No Health Insurance and Total Cases per 1,000 People: <b>0.6548</b>')),
                       h5(HTML('Percent High School Graduate and Total Deaths per 1,000 People: <b>-0.6411</b>')),
                       h5(HTML('Median Household Income and Total Cases per 1,000 People: <b>-0.6004</b>'))
                       )
              )
              ),
      
      tabItem(tabName = 'about',
              h4('About Me'),
              fluidRow(
                column(6,
                  h5('Author: Julianna Douglas'),
                  h5('Location: New Jersey'),
                  h5('Background: Mathematics and Data Analytics'),
                  h5('Social Media:'),
                  a('LinkedIn', href = 'https://www.linkedin.com/in/julianna-douglas-7b293a184/'),
                  '  |  ',
                  a('Github', href = 'https://github.com/douglaju'),
                  h5('Email:'),
                  a('douglaju@gmail.com', href = 'mailto:douglaju@gmail.com')
                ),
              
                column(6, img(src = './m3.jpg', width = '50%'))
                ),
              
              h4('Credits'),
              h6('Act Now Coalition. (2022). Counties Timeseries in State: New Jersey [Data file].
                 Retrieved from https://api.covidactnow.org/v2/county/NJ.timeseries.csv?apiKey=4d68a9acea3849d99559ebf2b976ffbb'),
              h6('Act Now Coalition. (2022). Single State Timeseries: New Jersey [Data file].
                 Retrieved from https://api.covidactnow.org/v2/state/NJ.timeseries.csv?apiKey=4d68a9acea3849d99559ebf2b976ffbb'),
              h6('Act Now Coalition. (2022). Counties Summary in State: New Jersey [Data file].
                 Retrieved from https://api.covidactnow.org/v2/county/NJ.csv?apiKey=4d68a9acea3849d99559ebf2b976ffbb'),
              h6('Jeeger Maru. (2020). NJ Counties Census Demographics (Version 1) [Data file].
                 Retrieved from https://www.kaggle.com/jeegarmaru/nj-counties-census-demographics?select=NJCountyDemographics.csv')
              
      )
    )
  )
)