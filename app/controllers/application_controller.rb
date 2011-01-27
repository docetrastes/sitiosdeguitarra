class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :admin?
  
  def admin?
    session[:admin]
  end
  
  protected
  
  def require_admin
    redirect_to root_path, :alert => "Acceso denegado." unless admin?
  end
end
