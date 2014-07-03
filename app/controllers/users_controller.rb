class UsersController < ApplicationController
  def signup
  	@user = User.new
  end
  
  def create
  	
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to '/index',:notice=>"Successfully signed up !"
  	else
  		render 'error'
  	end

  end
  
  def login
   
  if User.get_user(params) 
    flash.now[:notice]='Successfully signed in !'
   else
    flash.now[:notice]='Errr... !'
    render 'error',locals:{user:params}
  end
  end
  
  def signin    
  end
  
  def error 	
  end
  def index
    @users = User.all
  end

  private
  # only allowing the white list through.
   def user_params
      params.require(:user).permit(:user_name,:password,:password_confirmation)
   end

end
