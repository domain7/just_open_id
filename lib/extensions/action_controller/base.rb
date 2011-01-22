class ActionController::Base
  def self.require_user(options = {})
    raise Exception, "require_user cannot be called on ActionController::Base. Only it's subclasses" if self ==  ActionController::Base
    prepend_before_filter :require_user, options
  end
  
  helper_method :current_user

  protected

  # Filters  
  def require_user
    current_user.present? || deny_access
  end

  def store_location
    session[:return_to] = request.fullpath
  end
  
  def deny_access
    store_location
    redirect_to '/auth/google_apps'
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
