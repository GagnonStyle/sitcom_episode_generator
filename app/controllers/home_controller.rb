class HomeController < ApplicationController
  def index
  end

  def generate
  	params[:characters].reject! {|c| c.empty?}
  	@name1 = params[:characters].sample
  	params[:characters] = params[:characters] - [@name1]
  	@name2 = params[:characters].sample

  	@title = Title.generate

  	@episode = rand(1..6)*100 + rand(1..30)

    render :template => 'home/generate.js'
  end
end
