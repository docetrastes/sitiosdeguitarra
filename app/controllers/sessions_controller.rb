class SessionsController < ApplicationController
  def new
  end

  def create
    session[:admin] = (params[:password] == (ENV["PASSWORD"] || "monkey"))
    if session[:admin]
      redirect_to root_path, :notice => "Bienvenido."
    else
      redirect_to root_path, :alert => "No hay nada para ti."
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to root_path, :notice => "Hasta pronto."
  end
end
