module Results

  def store_results

    #Import global variables
    results_var

    #Store the information of each freelancer on an array of hashes
    #Each freelancers contains Name, Title, Description and Skills
    @attributes_arr = []

    for i in 1..@result_length

      #Define freelancer values
      name = @driver.find_element(:xpath, @profile_path + "[" + i.to_s + "]" + @name_id).attribute("title")
      title = @driver.find_element(:xpath, @profile_path + "[" + i.to_s + "]" + @title_id).text
      description = @driver.find_element(:xpath, "(" + @profile_path + "[" + i.to_s + "]" + @description_id + ")[2]").text

      skill_arr = []

      ##Iterate through the skills to store them
      if @driver.find_elements(:xpath, @profile_path + "[" + i.to_s + "]" + @skill_id).size > 0

        skill_size =  @driver.find_elements(:xpath, @profile_path + "[" + i.to_s + "]" + @skill_id).size

        for y in 1..skill_size

          skill = @driver.find_element(:xpath, "(" + @profile_path + "[" + i.to_s + "]" + @skill_id +")["+y.to_s+"]").text.downcase
          skill_arr.push(skill)

        end
      else

        @skill_id = "//span[@class='o-tag-skill m-sm-top m-0-bottom']"
        skill_size = @driver.find_elements(:xpath, @profile_path + "[" + i.to_s + "]" + @skill_id).size

        for y in 1..skill_size

          skill = @driver.find_element(:xpath, "(" + @profile_path + "[" + i.to_s + "]" + @skill_id + ")[" + y.to_s + "]").text.downcase
          skill_arr.push(skill)

        end
      end

      #Store attributes information into array
      @attributes_arr.push({:name => name, :title => title, :description => description, :skills => skill_arr})

    end
  end

  def validate_keyword

    #Validate the attributes that contain the keyword
    for i in 0..@attributes_arr.size-1

      check_name = @attributes_arr[i][:name].downcase.include? @keyword.downcase
      check_title = @attributes_arr[i][:title].downcase.include? @keyword.downcase
      check_description = @attributes_arr[i][:description].downcase.include? @keyword.downcase
      check_skills = @attributes_arr[i][:skills].include? @keyword.downcase

      if check_name || check_title ||check_description || check_skills
        attributes={:name => check_name,:title => check_title, :description => check_description, :skill => check_skills}
        match_attr = []
        attributes.each do |x|

          if x[1]

            match_attr.push(x[0])

          end
        end

        #Print what attributes contain the keyword
        puts @attributes_arr[i][:name] + " profile contains '" + @keyword + "' on the attributes " + match_attr.map { |y| y.to_s }.join(" ,") + "."

      else

        #Print what profiles don't contain the keyword on its attributes
        puts @attributes_arr[i][:name] + " profile DOES NOT contain '" + @keyword + "' on its information."

      end
    end
  end
end


