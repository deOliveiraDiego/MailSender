class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    user = User.find_by_email(email)
    if user
      session[:user_id] = user.id
      flash[:notice] = "Olá, #{user.name}."
      redirect_to root_path
    else
      flash[:alert] = "Olá, #{email}. Você precisa criar um usuário para usar o nosso sistema."
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logout feito com sucesso."
    redirect_to root_path
  end
end
