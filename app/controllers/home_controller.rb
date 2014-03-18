class HomeController < ApplicationController
  def index
  	@phrase = "Hello from Controller !"
  	@simple = "Re-Hello from Controller !"
  end

  def login
  	@users = C42Logins.all
  end
end
