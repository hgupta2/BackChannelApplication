class ApplicationController < ActionController::Base
  protect_from_forgery
  protected
  def authenticate_user
    unless session[:user_id]
      redirect_to(:controller => 'sessions', :action => 'login')
      return false
    else
      # set current_user by the current user object
      @current_user = User.find session[:user_id]
      return true
    end
  end

  #This method for prevent user to access Signup & Login Page without logout
  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'sessions', :action => 'home')
      return false
    else
      return true
    end
  end

  helper :all


  helper_method :ispostowner

  def ispostowner(userid,post)
    if userid == post.user_id
      return true
    end
  else
    return false
  end

  def iscommentowner(userid,comment)
    if userid == comment.user_id
      return true
    end
  else
    return false
  end

  helper_method :adminornot

  def adminornot
    @current_user = User.find session[:user_id]
    if @current_user.admin == true
      return true
    else
      return false
    end
  end



end