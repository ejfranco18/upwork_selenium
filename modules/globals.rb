module Globals

  def goto_site(site)
    #Go to site
    @driver.navigate.to site
  end

  def wait
    sleep 5
  end

  def results_var
    #Define the elements selectors from results page
    @profile_path = "(//article[@class='row responsive-visitor-tile'])"
    @name_id = "//a[@class='freelancer-tile-name']"
    @title_id = "//h4[@data-qa='tile_title']"
    @description_id = "//p[@data-qa='tile_description']"
    @skill_id = "//a[@class='o-tag-skill m-sm-top m-0-bottom']"
    @result_length = @driver.find_elements(:xpath, @profile_path).size
  end
end
