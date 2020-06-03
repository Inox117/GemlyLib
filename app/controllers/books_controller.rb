class BooksController < ApplicationController

  def index
    if(params.has_key?(:search) && !params[:search].empty? )
      @parameter = params[:search].downcase
      @books = Book.filter_by_title(@parameter)
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @books = Book.filter_by_title(@parameter)
      logger.debug @books
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :summary, :isbn10, :isbn13, :author, :illustrator, :publication_date, :publisher, :number_of_page)
    end
end
