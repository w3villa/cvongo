class WelcomeController < ApplicationController

  def index
  end

  def sync
  	system("bundle exec cucumber features/99acres.feature USER_ID=#{current_user.id}")
  	render text: "Done!"
  end

end
