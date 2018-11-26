require 'selenium-webdriver'

#Local path of the project
PATH = Dir.pwd

#Path for the webdriver for chrome and firefox
Selenium::WebDriver::Chrome.driver_path = PATH + "/drivers/chromedriver"
Selenium::WebDriver::Firefox.driver_path = PATH + "/drivers/geckodriver"

#Set the desired browser
BROWSER = :firefox
@driver = Selenium::WebDriver.for BROWSER