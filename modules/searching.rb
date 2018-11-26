module Search

  def search_keyword(keyword)

    #Define the elements selectors for the search field
    search_field = @driver.find_element(:xpath, "//div[@class='navbar-collapse d-none d-lg-flex']//div[@class='navbar-form']//input[@name='q']")
    dropdown = @driver.find_element(:xpath, "//div[@class='navbar-collapse d-none d-lg-flex']//span[@class='caret glyphicon air-icon-arrow-expand']")
    first_category = @driver.find_element(:xpath, "(//div[@class='navbar-collapse d-none d-lg-flex']//a[@class='ng-binding'])[1]")
    second_category = @driver.find_element(:xpath, "(//div[@class='navbar-collapse d-none d-lg-flex']//a[@class='ng-binding'])[2]")
    search_icon = @driver.find_element(:xpath,"//div[@class='navbar-collapse d-none d-lg-flex']//span[@class='glyphicon air-icon-search m-sm-left m-0-right']")

    search_field.send_keys(keyword)

    #Select Freelancers from dropdown, when the search field has job for default
    dropdown.click

    if first_category.text == "Freelancers"

      search_icon.click

    else

      second_category.click
      search_icon.click

    end
  end
end
