class HomeController < ApplicationController
  # Solo dejará mostrar el index si necesidad de ir a la página de login
  skip_before_action :authenticate_user!, :only => [:index]
  def index
  end
end
