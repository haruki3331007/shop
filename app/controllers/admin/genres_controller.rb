class Admin::GenresController < ApplicationController
    def new
        @genre=Genre.new
    end

    def index
        @genres=Genre.all
    end

    def create
        @genre=Genre.new(new_genre_params)
        @genre.save
        redirect_to admin_genres_path
    end

    def edit
        @genre=Genre.find(params[:id])
    end

    def update
        genre=Genre.find(params[:id])
        genre.update(genre_params)
        redirect_to admin_genres_path
    end

    private

    def new_genre_params
        params.permit(:name)
    end

    def genre_params
        params.require(:genre).permit(:name)
    end
end
