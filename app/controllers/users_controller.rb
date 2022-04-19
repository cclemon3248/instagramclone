class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to edit_user_path(current_user.id) unless current_user.id == @user.id
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー情報を編集しました！"
    else
      render :edit
    end
  end

  def favorite
    bookmarks = Favorite.where(user_id: current_user.id).pluck(:picture_id)
    @bookmark_list = Picture.find(bookmarks)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
