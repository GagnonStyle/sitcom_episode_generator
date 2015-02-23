class HomeController < ApplicationController
  def index
  end

  def generate
  	params[:characters].reject! {|c| c.empty?}
    if params[:characters] == []
      flash[:error] = 'Lets face it. You\'re not gonna get anywhere without any characters in your show.'
    else

      @title = Title.generate

      @episode_number = Episode.generate_number

      @episode_desc = Episode.generate_desc(params[:characters])

    end

    render :template => 'home/generate.js'
  end
end
