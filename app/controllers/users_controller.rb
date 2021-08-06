class UsersController < ApplicationController

  before_action :ensure_correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books

  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
    

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit( :name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
   unless @user == current_user
     redirect_to user_path(current_user)
   end
  end

end
