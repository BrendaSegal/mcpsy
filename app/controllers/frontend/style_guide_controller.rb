module Frontend
  class StyleGuideController < ApplicationController
    def index
      render 'frontend/style_guide.html.erb', layout: 'frontend/base.html.erb'
    end
  end
end
