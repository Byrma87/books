class HomeController < ApplicationController
  # before_acton :
  def index
 # byebug
     @books = Book.all

  end


end