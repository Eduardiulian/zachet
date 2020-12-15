class SessionController < ApplicationController
  before_action :already_logged, only: %i[login create new]
  def new; end

  def login; end

  # def destroy;
  # end

  def create
    user = User.find_by username: params[:session][:username]

    if user&.authenticate(params[:session][:password])
      #sign_in user
      p 'Login'
      sign_in user
      redirect_to root_url
    else
      p 'redirect'
      #flash.now[:danger] = 'Неверный логин или пароль'
      redirect_to session_new_url
    end
  end

  def logout
    sign_out
    redirect_to session_new_url
  end

  def already_logged
    redirect_to main_index_url if signed_in?
  end
end
