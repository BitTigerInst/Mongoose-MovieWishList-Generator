class TempsController < ApplicationController
  def destroy
  	if Temp.count > 0
  		@temp = Temp.find(params[:id])
  		@temp.destroy
  	end
  	session[:temps] = current_user.temps
  	redirect_to :back
  end
end
