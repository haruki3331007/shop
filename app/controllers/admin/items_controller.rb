class Admin::ItemsController < ApplicationController
    def index
        @item=Item.all
    end

    def new
        @item=Item.new
        @genres=Genre.all
    end

    def create
        item=Item.new(item_params)
        item.save
        redirect_to admin_item_path(item)
    end

    def show
        @item=Item.find(params[:id])
        @item_price=(@item.price*1.1).floor
    end

    def edit
        @item=Item.find(params[:id])
        @genres=Genre.all
    end

    def update
        item=Item.find(params[:id])
        item.update(item_params)
        redirect_to admin_item_path(item.id)
    end

    private

    def item_params
        params.require(:item).permit(
                                    :image, 
                                    :name, 
                                    :introduction, 
                                    :genre_id, 
                                    :price, 
                                    :is_active)
                                    
    end
end
