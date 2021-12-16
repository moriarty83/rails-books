class BooksController < ApplicationController
    
    before_action :id, only: [:show, :destroy, :update]
    
    def index
        books = Book.all
        render json:{response: 200, books: books}
    end
    def show
        book = Book.find(@id)
        render json: {status: 200, book: book}
    end

    def preview
        quote = Book.select(:quote, :id).find(params[:id])
        render json: {status: 200, quote: quote}
    end

    def create
        book = Book.new(book_params)

        if book.save 
            render(json: {book: book}, status: 201)
        else
            render(json: {book: book}, status: 422)
        end
    end

    def update 
        book = Book.find(params[:id])
        book.update(book_params)
        render json: {book: book}

    end

    def destroy
        book = Book.destroy(params[:id])
        render(status: 204)
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :genre, :publisher, :publish_date, :quote)
    end

    def id
        @id = params[:id]
    end
end
