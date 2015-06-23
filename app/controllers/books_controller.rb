class BooksController < ApplicationController
	def index
    @books = Book.all
	end
  def show
    @book = Book.find(slug: params[:id])
  end
end