And /^I should break$/ do
  puts "Debugger Start"
  debugger
  puts "Debugger End"
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