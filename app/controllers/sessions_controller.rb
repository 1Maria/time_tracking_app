class SessionsController < ApplicationController

  def new
  end

  def create
    developer = Developer.authenticate_developer(params[:email_address], params[:password])

    if developer
      session[:developer] = developer.id
      redirect_to root_url
    else
      flash.now.alert = "Invalid Email or Password"
      render 'new'
    end
  end

  def destroy
    session[:developer] = nil
    redirect_to root_url, notice: "Signed out successfully"
  end
end
