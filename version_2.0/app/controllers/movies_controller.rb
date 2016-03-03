require 'json'
require 'net/http'
require 'open-uri'
class MoviesController < ApplicationController
  def show
      movie = "http://api.themoviedb.org/3/movie/"+params[:id]+"?api_key=" + APP_ID
      uri = movie
      data = open(uri)
      @movie = JSON.load(data)
      trailer = 'http://api.themoviedb.org/3/movie/'+params[:id]+'/videos?api_key=' + APP_ID
      data_trailer = open(trailer)
      @movie_trailer = JSON.load(data_trailer)['results'][0]
      images = 'http://api.themoviedb.org/3/movie/'+params[:id]+'/images?api_key=' + APP_ID
      @movie_images = JSON.load(open(images))['backdrops']
      # render :json => JSON.load(data)
  end
end
