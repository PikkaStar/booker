class UsersController < ApplicationController
  before_action :user_sign_in
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
   @user = User.find(params[:id])
   @book = Book.new
   @user_new = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
  else
    render :edit
  end
end

  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
   def user_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
