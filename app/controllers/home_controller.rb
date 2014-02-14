class HomeController < ApplicationController

  def index
    if params[:tag]
      @creatives = Creative.tagged_with(params[:tag])
    else
      @creatives = Creative.all
    end
  end

end
