class HomeController < ApplicationController
  def index
  	@phrase = "Hello from Controller !"
  	@simple = C42Logins.first
  end

  def login
  	users = C42Logins.first
  end
end
