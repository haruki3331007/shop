class Admin::ItemsController < ApplicationController
    def index
        @item=Item.all
    end

    def new
        @item=Item.new
        @genres=Genre.all
    end

    def create
        item=Item.new(item_new_params)
        item.save
        redirect_to admin_item_path(item)
    end

    def show
        @item=Item.find(params[:id])
    end

    private

    def item_new_params
        params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
    end
end
