class GraftsController < ApplicationController
def update
     @book = Book.find(params[:id])

     if @book.update(book_params)
   
   redirect_to @book, notice: 'добавили в черновики'
     else
       render 'edit'
     end
   end

  def book_params
   byebug
    params.require(:book).permit(:title, :genre, :graft, :contents, {image: []})
  end
end