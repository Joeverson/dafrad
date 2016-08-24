class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:login][:email])
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = t('.error')
      redirect_to '/login'
      # redirect_to '/login', error: t('.error')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
