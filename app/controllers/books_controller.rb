class BooksController < ApplicationController
  before_action :authorize, only: [:new, :create]
  
  def index
    @books =Book.all
    @books = current_user.books if params[:my]
  # byebug
  end

   def show
   @book = Book.find(params[:id])
   # byebug
  # @votes = @petition.votes.size
  # # render json:@petition
   end

   def new
     @book = Book.new
   end

  def create
    @book = current_user.books.new(book_params)
    # byebug
    if @book.save
      redirect_to @book
    else
    flash.now.alert = "Ошибка создания петиции"
    render 'new'
    end
  end

   def edit
  #   # byebug
     @book = Book.find(params[:id])
   end

  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
   
   redirect_to @book, notice: 'Петиция изменена'
     else
       render 'edit'
     end
   end

   def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to @book, notice: 'Петиция удалена'
   end

  def book_params
   # byebug
    params.require(:book).permit(:title, :genre, :graft, :contents, {image: []})
  end
end