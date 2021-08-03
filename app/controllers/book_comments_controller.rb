class BookCommentsController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:destroy]

def create
 book = Book.find(params[:book_id])
 comment = BookComment.new(book_comment_params)
 comment.user_id = current_user.id
#  comment = current_user.book_comments.new(book_comment_params)
 comment.book_id = book.id
 comment.save
 redirect_to user_path(book.user)
end

def destroy
 @book = Book.find(params[:book_id])
 BookComment.find_by(id: params[:id],book_id:params[:book_id]).destroy
 redirect_to book_path(params[:book_id])
end

private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end


end
