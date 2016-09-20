class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash.now[:error] = "Invalid login. Please try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Goodbye!"
    redirect_to root_path
  end
end
