class ApplicationController < ActionController::Base
  include SessionHelper

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  end

  private

  def authenticate
    redirect_to signin_path unless current_user
  end
end
