And /^I should break$/ do
  puts "Debugger Start"
  debugger
  puts "Debugger End"
end

Given /^I wait for (\d+) seconds?$/ do |n|
  sleep(n.to_i)
end

And /^I switch window$/ do
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
end

Then /^I should scrap cities$/ do
  Nokogiri::HTML(page.html).css("#selectcity").children.each do |option|
    p City.new({name: option.children.inner_text}).save
  end
end

Then /^I should scrap localities$/ do
  @city = City.where(id: ENV["CITY_ID"]).first
  debugger
  step %{I select "#{@city.name}" from "City"}
  debugger
  Nokogiri::HTML(page.html).css("select[name='Locality']").children.each do |option|
    
  end
end


When(/^I log-in in 99acres$/) do
  @user = User.where(id: ENV["USER_ID"]).first
  @account = @user.accounts.where({accounts: {website_name: MERCHANTS[:acres]}}).first
  step %{I fill in "username" with "#{@account.username}"}
  step %{I fill in "password" with "#{@account.password}"}
  step %{I press "Login >>"}
end

When(/^I log-in in sulekha$/) do
	@user = User.where(id: ENV["USER_ID"]).first
  @account = @user.accounts.where({accounts: {website_name: MERCHANTS[:sulekha]}}).first
  page.driver.execute_script(%{$("#newSignin").trigger("click")})
  step %{I fill in "txtEmail" with "#{@account.username}"}
  step %{I fill in "txtPass" with "#{@account.password}"}
  page.driver.execute_script(%{$(".control-group.last .HPTrack").trigger("click")})
  step %{I should break}
end