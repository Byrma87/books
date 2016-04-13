class BooksController < ApplicationController
  before_action :authorize, only: [:new, :create]
  
  def index
    @books =Book.all
  end

   def show
   @book = Book.find(params[:id])
  # # byebug
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

     if @book.update(petition_params)
    # flash.now[:notice] = "Петиция обновлена"
   redirect_to @book, notice: 'Петиция изменена'
     else
       render 'edit'
     end
   end

  # def destroy
  #   @petition = Petition.find(params[:id])
  #   @petition.destroy
  #   redirect_to @petition, notice: 'Петиция удалена'
  # end
  def book_params
    params.require(:book).permit(:title, :genre, :contents)
  end
end