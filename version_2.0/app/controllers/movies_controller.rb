require 'json'
require 'net/http'
require 'open-uri'
class MoviesController < ApplicationController
  def show
      movie = "https://api.themoviedb.org/3/movie/"+params[:id]+"?api_key=" + APP_ID
      uri = movie
      data = open(uri)
      @movie = JSON.load(data)
      # render :json => JSON.load(data)
  end
end
