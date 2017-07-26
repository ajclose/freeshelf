class BooksController < ApplicationController

  before_action do
  if @current_user.blank?
    redirect_to login_path
  end
end

  def index
    @books = Book.all
  end


  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == @current_user
      redirect_to root_path
    end
  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.link = params[:book][:link]
    @book.user = @current_user
    if @book.save
    redirect_to @book
    else
    render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    unless @book.user == @current_user
      redirect_to root_path
    end
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.link = params[:book][:link]
    @book.user = @current_user
    if @book.save
    redirect_to @book
    else
      render 'edit'
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

end
