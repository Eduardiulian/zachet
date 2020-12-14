class ApplicationController < ActionController::Base
  include SessionHelper
  before_action :set_locale

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  end

  private

  def authenticate
    redirect_to signin_path unless current_user
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_ortions(options = {})
    { locale: I18n.locale }.merge option
  end
end
