# frozen_string_literal: true

# helper for auth
module SessionHelper
  def sign_in(user)
    # cookies.signed[:user_id] = { value: user.id, expires: 10.days }
    session[:current_user_id] = user.id
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:current_user_id] = nil
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  # def current_user
  #   @current_user ||= User.find_by(id: cookies.signed[:user_id]) # "если current_user на данном этапе nil, то нужно выполнить...
  #   # иначе - "
  # end
  #
  # def sign_in(user)
  #   session[:current_user_id] = user.id
  #   self.current_user = user
  # end
  #
  # def sign_out
  #   session[:current_user_id] = nil
  #   self.current_user = nil
  # end
  #
  # def current_user=(user)
  #   @current_user = user
  # end
end
