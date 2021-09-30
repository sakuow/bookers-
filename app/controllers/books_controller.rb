class BooksController < ApplicationController

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       redirect_to book_path(@book.id)
    else
       render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
    @newbook = Book.new
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
