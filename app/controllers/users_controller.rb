class UsersController < ApplicationController
  
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
    if @user = current_user
      redirect_to edit_user_path(current_user)
    else
      render "show"
    end
  end
    
  def updte
    user = User.find(params[:id])
    if user.update(user_params)
      # flash[:notice] = "You have updated user successfully."
      redirect_to users_path(user.id)
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit( :name, :profile_image, :introduction)
  end
  
  
  
end
