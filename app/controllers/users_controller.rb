class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :destroy]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in(user)
      redirect_to mypage_path(user)
    else
      render 'new'
    end
  end

  def show
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to mypage_path
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    redirect_to signup_path
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
