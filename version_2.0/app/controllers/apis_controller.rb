require 'json'
require 'net/http'
require 'open-uri'
# require 'constants.rb'

class ApisController < ApplicationController
  $get_top_movie = "http://api.themoviedb.org/3/movie/top_rated?api_key="+APP_ID
  def self.get_top_movie
    uri = $get_top_movie +"&page=1"
    data = open(uri)
    $movies = JSON.load(data)['results']
    $user = current_user
  end

  def get_movie
    uri = $get_top_movie + "&page=" + params[:page].to_s
    data = open(uri)
    render :json => JSON.load(data)['results']
  end

  def get_wish
    fav_lists = current_user.fav_kinds.group(:genre_id).count
    top_fav = fav_lists.key(fav_lists.values.max)
    @fav_kind = Genre.find_by_genre_id(top_fav)
    # lucky_number = rand(1..10)
    get_top_genre_movie ="http://api.themoviedb.org/3/genre/"+top_fav.to_s+"/movies?api_key="+APP_ID
      uri = get_top_genre_movie+"&page="+params[:page].to_s
      data = open(uri)
      user = current_user.id.to_json
     render :json => JSON.load(data)['results']
      # @recommended_movies = JSON.load(data)['results']
      # @user_id = JSON.load(user)
  end

  def discover
    discover ="http://api.themoviedb.org/3/discover/movie?api_key=" +APP_ID
    uri = discover+"&page="+params[:page].to_s
      data = open(uri)
      user = current_user.id.to_json
     render :json => JSON.load(data)['results']
  end
end
