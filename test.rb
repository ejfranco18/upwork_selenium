require_relative 'config/env'
require_relative 'modules/globals'
require_relative 'modules/searching'
require_relative 'modules/store_results'
require_relative 'modules/select_profile'

include Globals
include Search
include Results
include Profile

#Define the URL
goto_site("http://www.upwork.com/")

#Define the keyword to be searched
@keyword = "qa"


puts "-----The searched keyword should be on at least one attribute on each profile on the result page-----"
#Search the keyword on the home page
search_keyword(@keyword)
#Validate if the keyword is displayed on any attribute of the displayed profiles
store_results
validate_keyword


puts "\n-----Select random profile and validate if the information matches the data shown on the result page-----"
#Select a random profile from a the result page
select_profile
store_data_profile
#Click on the selected profile
click_profile
#Validate if the information inside the profile matches the data displayed on the results page
validate_data_profile


@driver.quit



