# survey-monkey-with-React
Survey Monkey clone with ReactJS for dynamic form building

## This was a project to create a SurveyMonkey clone with the following objectives: 
  - Be able to create a survey with dynamic input fields
  - Be able to create a submission to a particular survey
  - Be able to display information on the number of submissions and data related to a particular survey

## The following libraries / technologies were used to achieve this: 
  - **ReactJS** for dynamic forms with one-way data binding
  - **d3.js** for generating charts based on survey data
  - **Ruby on Rails** as a backend for orchestrating routes and generating __JSON__ data

****
## Screenshots
`surveys#owner_display` 
![screenshot](https://raw.githubusercontent.com/tgoldenberg/survey-monkey-with-React/master/gorilla-graph.png)
****
`surveys#new`
![screenshot](https://raw.githubusercontent.com/tgoldenberg/survey-monkey-with-React/master/gorilla-survey2.png)
****
`surveys#show`
![screenshot](https://raw.githubusercontent.com/tgoldenberg/survey-monkey-with-React/master/gorilla-survey.png)
****

# Getting started 
#### To use the project, just do the following: 
  - clone the repository
  -  `rake db:create`
  -  `rake db:migrate`
  -  `rails g react:install`
  -  `rails s`
  -  Enjoy!
