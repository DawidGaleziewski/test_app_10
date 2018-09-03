class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
  def require_same_user
    #we put this below so require_user executed and we know  current_user won't blow up
    #we know also set_article has executed above so @article.user won't blow up
    if current_user != @article.user
      flash[:danger] = 'You can only edit or delete your own article'
      redirect_to root_path
    end
  end
  
end
