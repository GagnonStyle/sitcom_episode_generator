class HomeController < ApplicationController
  def index
  end

  def generate
  	@name1 = params[:cast_members].sample
  	@name2 = params[:cast_members].sample
    render :template => 'home/generate.js.haml'
  end
end
