class SessionsController < ApplicationController

  before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
  before_filter :save_login_state, :only => [:index, :login, :login_attempt]


  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Welcome, you logged in as #{authorized_user.username}"
      if (authorized_user.admin == true)
        redirect_to(:controller => 'users', :action => 'index')
      else
        redirect_to(:controller => 'posts', :action => 'index')
      end

        else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

end