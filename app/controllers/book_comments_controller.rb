class BookCommentsController < ApplicationController
before_action :authenticate_user!
before_action :current_user, only: [:destroy]

def create
 @book = Book.find(params[:book_id])
 @comment = BookComment.new(book_comment_params)
 @comment.user_id = current_user.id
 @comment.book_id = @book.id
 @comment.save
 @new_comment = BookComment.new
 # 非同期通信のために削除
 # redirect_to request.referer
end

def destroy
 @book = Book.find(params[:book_id])
 BookComment.find_by(id: params[:id],book_id: params[:book_id]).destroy
 @new_comment = BookComment.new
 # 非同期通信のため削除
 # redirect_to request.referer
end

private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end


end
