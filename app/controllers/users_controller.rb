class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :confirm_user, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]

  def index
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def update
    unless @user_info.update(user_params)
      redirect_to user_diaries_path(current_user.id)
    else
      redirect_to edit_user_path(current_user.id), notice: '編集できませんでした'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def confirm_user
    @user = current_user.id
      if current_user.id == @user
      else
        redirect_to new_user_session_path
      end
  end

  def set_user
    @user_info = User.find_by(id: params[:id])
  end

end
