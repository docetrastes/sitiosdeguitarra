class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin?
  before_filter :ensure_domain if Rails.env == "production"

  def admin?
    session[:admin]
  end

  protected

  def require_admin
    redirect_to root_path, :alert => "Acceso denegado." unless admin?
  end

  def ensure_domain
    if request.host != desired_host
      fake_request = Rack::Request.new(request.env.merge("HTTP_HOST" => desired_host))
      redirect_to fake_request.url, :status => :moved_permanently
    end
  end

  def desired_host
    ActionMailer::Base.default_url_options[:host]
  end
end
