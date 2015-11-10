class LoginsController < ApplicationController
  
  def new
    #there isn't anything to create. the browser cookie creates the session automatically
  end
  
  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "You are now logged in as " + chef.chefname
      redirect_to recipes_path
  
    else
      flash.now[:danger] = "Incorrect email and password combination. Please try again."
      render 'new'
    end
  end
  
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out successfully"
    redirect_to root_path
  end
  
end