class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "users.create"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "users.update"
      redirect_to user_path @user
    else
      render :edit
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "users.no_user"
    redirect_to root_path
  end
end
