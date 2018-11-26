module Profile

  def select_profile

    #Define name element selector to select random profile
    @results = "//h4[@class = 'm-0-top-bottom display-inline-block d-none d-lg-block d-xl-block']//a[@class = 'freelancer-tile-name']"
    result_size = @driver.find_elements(:xpath, @results).size
    @random_result = rand(1..result_size)

  end

  def store_data_profile

    #Store data from the selected profile
    selected_name = @driver.find_element(:xpath, @profile_path + "[" + @random_result.to_s + "]" + @name_id).attribute("title")
    selected_title = @driver.find_element(:xpath, @profile_path + "[" + @random_result.to_s + "]" + @title_id).text
    selected_description = @driver.find_element(:xpath, "(" + @profile_path + "[" + @random_result.to_s + "]" + @description_id + ")[2]").text

    @selected_attributes_arr = [{:name => selected_name, :title => selected_title, :description => selected_description}]

  end

  def click_profile

    #Click the random profile
    selected_element = @driver.find_element(:xpath, "(" + @results + ")[" + @random_result.to_s + "]")
    puts selected_element.text + " profile is the selected profile."
    selected_element.click

  end

  def validate_data_profile

    if @driver.find_elements(:xpath, "//h2[@class='m-xs-bottom']//span[@class='ng-binding']").size > 0
      name_profile = @driver.find_element(:xpath, "//h2[@class='m-xs-bottom']//span[@class='ng-binding']").text
      title_profile = @driver.find_element(:xpath, "//span[@class='up-active-context up-active-context-title fe-job-title inline-block m-lg-right']//span[@class='ng-binding']").text
      description_profile = @driver.find_element(:xpath, "(//p[@class='break text-pre-line up-active-context m-0-bottom m-lg-right ng-isolate-scope']//span[@class='ng-scope'])[1]").text

    else
      name_profile = @driver.find_element(:xpath, "//h2[@class='m-xs-bottom ng-binding']").text
      title_profile = @driver.find_element(:xpath, "//div[@class='air-card m-0-top-bottom']//h3[@class='m-sm-bottom ng-binding ng-scope']").text
      description_profile = @driver.find_element(:xpath, "//div[@class='break text-pre-line ng-isolate-scope']//span[@class='ng-scope']").text

    end

    if name_profile.include? (@selected_attributes_arr[0][:name])
      puts "The name in the profile is the same as the one displayed in the results page."
    else
      puts "The name in the profile is different."
    end

    if title_profile.include? (@selected_attributes_arr[0][:title])
      puts "The title in the profile is the same as the one displayed in the results page."
    else
      puts "The title in the profile is different."
    end

    if description_profile.include? (@selected_attributes_arr[0][:description].chomp(" ..."))
      puts "The description in the profile is contained on the one displayed in the results page."
    else
      puts "The description in the profile is different."
    end
  end
end