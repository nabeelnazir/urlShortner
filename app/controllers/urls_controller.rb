class UrlsController < ApplicationController
  def show
    url = Url.find_by(short_url: params[:id])
    redirect_to url.long_url
  end


  def create
    shortener = Shortener.new(url_params[:long_url])
    @url = shortener.generateShortUrl 

    if !@url.nil? && @url.persisted?
      respond_to :js
    else
      render 'error.js.erb'
    end

  end

  private 

  def url_params
    params.require(:url).permit(:long_url)
  end
end