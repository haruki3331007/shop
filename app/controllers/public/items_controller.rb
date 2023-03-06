class Public::ItemsController < ApplicationController
    def index
        @items=Item.all
    end

    def show
        @item=Item.find(params[:id])
        @item_price=(@item.price*1.1).floor
    end
end
