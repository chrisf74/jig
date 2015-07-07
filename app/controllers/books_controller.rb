class BooksController < ApplicationController
	def index
    @books = Book.all
	end
  def show
    @book = Book.find_by(slug: params[:id])
    @book_data = @book.json_data()
  end
end