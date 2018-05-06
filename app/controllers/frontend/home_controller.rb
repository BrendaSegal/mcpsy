module Frontend
  class HomeController < ApplicationController
    def index
      render 'frontend/home.html.erb', layout: 'frontend/base.html.erb'
    end
  end
end
