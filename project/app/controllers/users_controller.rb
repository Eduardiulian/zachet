# frozen_string_literal: true

# Controller for users
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :already_logged, only: %i[new create]

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to main_index_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update; end

  def destroy; end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :headline, :tube_description, :link, :email, :password, :password_confirmation)
    end

    def already_logged
      redirect_to main_index_url if signed_in?
    end
end
