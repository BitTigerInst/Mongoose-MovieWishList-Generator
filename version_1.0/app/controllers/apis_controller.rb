require 'json'
require 'net/http'
require 'open-uri'
# require 'constants.rb'
class ApisController < ApplicationController
  $get_top_movie = "http://api.themoviedb.org/3/movie/top_rated?api_key="+APP_ID

  def self.get_top_movie

    uri = $get_top_movie +"&page="+$counter.to_s
    data = open(uri)
   $movies = JSON.load(data)
    #  render :text =>data
    # redirect_to :controller=>'users', :action=>'set_up', :id=>current_user.id
  end
  def top_rated_next
    $counter +=1

    redirect_to :controller=>'users', :action=>'set_up', :id=>current_user.id
  end
  def top_rated_prev
    $counter -=1
    redirect_to :controller=>'users', :action=>'set_up', :id=>current_user.id
  end

  def get_top_genre_movie
    lucky_number = rand(1..10)
    $get_top_genre_movie ="http://api.themoviedb.org/3/genre/"+params[:id].to_s+"/movies?api_key="+APP_ID
      uri = $get_top_genre_movie+"&page="+lucky_number.to_s
      res = open(uri)
      $recommended_movies = JSON.load(res)
      redirect_to :back
  end

  def self.get_recomend
    lucky_number = rand(1..10)

      $get_top_genre_movie ="http://api.themoviedb.org/3/genre/12/movies?api_key="+APP_ID
      uri = $get_top_genre_movie+"&page="+lucky_number.to_s
      res = open(uri)
      $recommended_movies = JSON.load(res)
  end

  def self.get_movie
    id = "9738"
    $get_movie = "https://api.themoviedb.org/3/movie/"+id+"?api_key="+APP_ID
    uri = $get_movie
    res = open(uri)
    data = JSON.load(res)
    
  end

end
