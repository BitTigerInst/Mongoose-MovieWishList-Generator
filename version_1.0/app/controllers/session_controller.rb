class SessionController < ApplicationController
  def index
  end

  def create
  	email = params[:email]
  	user = User.find_by_email(email)
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
      # session[:top_genre_id] = 12

  		redirect_to "/users/#{current_user.id}"
  	else
  		flash[:errors] = ['Invalid combination']
  		redirect_to "/session"
  	end
  end

  def destroy
  	reset_session
    $recommended_movies = nil
  	redirect_to "/session"
  end
end
