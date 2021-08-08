class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    content = params[:content]
    model = params[:model]
    method = params[:method]
    
    if model == 'User'
      @users = User.search(content, method)
    else
      @books = Book.search(content, method)  
    end
  
  end
  
  
  
  
  end
