class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book, only: [:edit, :update]

  def index
    @books = Book.all
  	@user = current_user
  	@booknew = Book.new
  end

  def show
    @booknew = Book.new
  	@book = Book.find(params[:id])
    @user = @book.user
    @books = Book.all
  end

  def new
  	@booknew = Book.new
  end

  def create
        @booknew = Book.new(book_params)
        @booknew.user_id = current_user.id
        if @booknew.save
          flash[:notice] = "You have creatad book successfully."

            redirect_to book_path(@booknew)
        else
        	@books = Book.all
          @user = current_user
          render :index
        end
    end

def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end




  def edit
       @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


    private
    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end

  def correct_book
     @correct_book = current_user.books.find_by(id: params[:id])
    unless @correct_book
      redirect_to books_path
    end
  end
end
