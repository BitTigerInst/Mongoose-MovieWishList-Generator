class UsersController < ApplicationController
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
      $counter = 1
      session[:user_id] = @user.id
      redirect_to :controller=>'users',:action =>'set_up',:id=>current_user.id
    end
  end

  def show
    @temps = current_user.temps
    @temp_all
    @wantwatch = WantWatch.find_by_user_id(current_user.id)
    session[:temps] = current_user.temps
    ApisController.get_recomend
  end

  def wishlist
    if !@arr
      @arr = []
    end
    @temps = current_user.temps
    @temps.each do |t|
        tt = t.genre_ids[1..t.genre_ids.length-1]
        tt_array = tt.split(",").map{ |s| s.to_i }
       @arr += tt_array.flatten
    end

    if !@map
      @map = Hash.new(0)
    end
    @arr.each{ |i| @map[i] += 1 }

   puts @map.inspect
   @top_genre_name = Genre.find_by_genre_id(@map.key(@map.values.max)).name
   session[:top_genre_id] = @map.key(@map.values.max)
   render :json => { 
         :top => @top_genre_name
      }

  end

  def set_up
    session[:temps] = current_user.temps
    ApisController.get_top_movie


  end

  def carts
    # puts data.inspect
    @movie_title = params[:movie_title]
    @movie_id = params[:movie_id]
    @movie_genre_ids = params[:movie_genre_ids]
    @pic = params[:movie_pic]
    # (session[:movie_title_list] ||= []) << (params[:movie_title] if !session[:movie_title_list].include?params[:movie_title])
    #   session[:movie_title_list] = session[:movie_title_list]-[nil]
    if current_user.temps.find_by_movie_id(@movie_id)==nil
      @temp = Temp.new(title:@movie_title,movie_id:@movie_id,genre_ids:@movie_genre_ids,pic:@pic,user:current_user)
      @temp.save
    end

    session[:temps] = current_user.temps

    if params[:from] == "form"
      redirect_to :back
    else
      render :json => { 
           # :movie_title => @movie_title, 
           # :movie_id => @movie_id,
           # :movie_title_list => session[:movie_title_list],
           # :movie_genre_ids => @movie_genre_ids
           :msg => "success"
        }
    end
  end

  def add_to_want_watch
    if WantWatch.count == 0 || !WantWatch.find_by_user_id(current_user.id)
      w = WantWatch.create(user:current_user)
      if w.list == nil
        w.list = []
      else
        w.list << params[:id]
      end
      w.save
    end

    if WantWatch.find_by_user_id(current_user.id).list
      w = WantWatch.find_by_user_id(current_user.id)
      l = WantWatch.find_by_user_id(current_user.id).list
        l << params[:id]
      w.save
    end
    redirect_to :back

  end

  def add_to_watched

  end

  def want_watch
    @list = WantWatch.find_by_user_id(current_user.id).list
    # ApisController.get_movie
  end

  private
  def user_params
    params.require(:user).permit(:email,:first_name,:last_name,:password,:password_confirmation)
  end
end
