class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end
 
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end
  
  def edit
  end
  
  def update
  end


  def show
    @book =Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end
