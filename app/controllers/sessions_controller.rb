class SessionsController < ApplicationController

  def new
  end

  def create
    developer = Developer.authenticate_developer(params[:email_address], params[:password])

    if developer
      session[:developer_id] = developer.id
      redirect_to root_url
    else
      flash.now.alert = "Invalid Email or Password"
      render 'new'
    end
  end

  def destroy
    session[:developer_id] = nil
    redirect_to login_path, notice: "Signed out successfully"
  end
end
