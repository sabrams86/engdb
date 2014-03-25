class ApplicationController < ActionController::Base

  def current_user
      @current_user ||= User.find_by_id(session[:user_id])
      return @current_user
  end

  def forem_user
    current_user
  end
  helper_method :forem_user

  before_filter :authorize
  protect_from_forgery
  
  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, alert: "Please log in to proceed"
    end
  end
  
  def eng_check
    user = User.find_by_id(session[:user_id])
    unless user.present? && (user[:department] == "Engineering" or user[:department] == "Admin")
      redirect_to home_url, alert: "You have attempted to access features that you do not have access to.  Please contact your site administrator for more information."
    end
  end
  
  def mfg_check
    user = User.find_by_id(session[:user_id])
    unless user.present? && (user[:department] == "Manufacturing" or user[:department] == "Admin")
      redirect_to home_url, alert: "You have attempted to access features that you do not have access to.  Please contact your site administrator for more information."
    end
  end
  
  def acct_check
    user = User.find_by_id(session[:user_id])
    unless user.present? && (user[:department] == "Accounting" or user[:department] == "Admin")
      redirect_to home_url, alert: "You have attempted to access features that you do not have access to.  Please contact your site administrator for more information."
    end
  end
  
  def sales_check
    user = User.find_by_id(session[:user_id])
    unless user.present? && (user[:department] == "Sales" or user[:department] == "Admin")
      redirect_to home_url, alert: "You have attempted to access features that you do not have access to.  Please contact your site administrator for more information."
    end
  end
  
  def admin_check
    user = User.find_by_id(session[:user_id])
    unless user.present? && user[:department] == "Admin"
      redirect_to home_url, alert: "You have attempted to access features that you do not have access to.  Please contact your site administrator for more information."
    end
  end
  
end
