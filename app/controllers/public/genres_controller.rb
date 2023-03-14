class Public::GenresController < ApplicationController
    def show
        @genre=Genre.find(params[:id])
        @genres=@genre.items.all
    end
end
