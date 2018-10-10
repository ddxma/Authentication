class UsersController < ApplicationController
  def new
	@user = User.new
 end

def create 
  @user = User.new(user_params) 
  if @user.save
  	# Sessions are stored as key/value pairs
  	# Create a new session by taking the value @user.id and
  	#   assigning it to the key :user_id
    session[:user_id] = @user.id 
    redirect_to '/' 
  else 
    redirect_to '/signup' 
  end 
end


 private 
 def user_params
 	params.require(:user).permit(:first_name, :last_name, :email, :password)
 end


end
