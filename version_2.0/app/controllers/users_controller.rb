require 'json'
require 'net/http'
require 'open-uri'
class UsersController < ApplicationController
  $get_top_movie = "http://api.themoviedb.org/3/movie/top_rated?api_key="+APP_ID

  def index

  end

  def create
    @user = User.new(user_params)
    if !@user.save
      flash[:errors] = @user.errors.full_messages
      redirect_to :back

    else
      #save user, get top rated movies for users to pick
      @user.save
      session[:user_id] = @user.id
      # render :set_up
      redirect_to :controller=>'users', :action=>'set_up', :id=>current_user.id
    end
  end

  def show
    fav_lists = current_user.fav_kinds.group(:genre_id).count
    top_fav = fav_lists.key(fav_lists.values.max)
    @fav_kind = Genre.find_by_genre_id(top_fav)
    lucky_number = rand(1..10)
    get_top_genre_movie ="http://api.themoviedb.org/3/genre/"+top_fav.to_s+"/movies?api_key="+APP_ID
      uri = get_top_genre_movie+"&page="+lucky_number.to_s
      data = open(uri)
      user = current_user.id.to_json
      @recommended_movies = JSON.load(data)['results']
      @user_id = JSON.load(user)
      # redirect_to :back
  end

  def set_up
    # ApisController.get_top_movie
    uri = $get_top_movie +"&page=1"
    data = open(uri)
   
    user = current_user.id.to_json
    @movies = JSON.load(data)['results']
    @user_id = JSON.load(user)

  end

  def carts

    # puts params[:favs].inspect
    params[:favs].each do |f|
      puts f.inspect
      movie_id = f[0]
      movie_pic = f[1]['poster_path']
      movie_title = f[1]['title']
      movie_genre_ids = f[1]['genre_ids']
      if Movie.find_by_movie_id(movie_id) == nil
        movie = Movie.new(title:movie_title, movie_id:movie_id, pic:movie_pic)
        movie.save
      end
      if current_user.fav_movies.find_by_movie_id(movie_id) == nil
        FavList.create(user:current_user, movie:Movie.find_by_movie_id(movie_id))  
        movie_genre_ids.each do |g|
          FavKind.create(user:current_user, genre_id:g)
        end
      end
    end
    #you can save to db table
    render :json =>{msg:"success"}
    # redirect_to :controller=>'users', :action=>'show', :id=>current_user.id
  end

  def wishes
    params[:favs].each do |f|
      puts f.inspect
      movie_id = f[0]
      movie_pic = f[1]['poster_path']
      movie_title = f[1]['title']
      movie_genre_ids = f[1]['genre_ids']
      if Movie.find_by_movie_id(movie_id) == nil
        movie = Movie.new(title:movie_title, movie_id:movie_id, pic:movie_pic)
        movie.save
      end
      if current_user.wish_movies.find_by_movie_id(movie_id) == nil
        WishList.create(user:current_user, movie:Movie.find_by_movie_id(movie_id))  
        # movie_genre_ids.each do |g|
        #   FavKind.create(user:current_user, genre_id:g)
        # end
      end
    end
    render :json =>{msg:"success"}
  end

  def show_wishes
    @wishes = current_user.wish_movies
  end

  def remove_wish
    current_user.wish_lists.find_by_movie_id(params[:id]).destroy
    redirect_to :back
  end

  def remove_favs

    if current_user.fav_lists.find_by_movie_id(params[:id])
     current_user.fav_lists.find_by_movie_id(params[:id]).destroy
    end
    redirect_to :back
    
  end
  def show_favs
    @movies = current_user.fav_movies
  end
  private
  def user_params
    params.require(:user).permit(:email,:first_name,:last_name,:password,:password_confirmation)
  end
end
