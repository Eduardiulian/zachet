# frozen_string_literal: true

# Controller for sessions
class SessionController < ApplicationController
  before_action :already_logged, only: %i[login create new]
  def new; end

  def login; end

  def create
    user = User.find_by username: params[:session][:username]

    if user&.authenticate(params[:session][:password])
      p 'Login'
      sign_in user
      redirect_to root_url
    else
      p 'redirect'
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
