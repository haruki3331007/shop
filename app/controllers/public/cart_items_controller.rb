class Public::CartItemsController < ApplicationController
    def index
        if (params[:flag]=="1")
            @cart_items=current_customer.cart_items.all
            @cart_items.destroy_all
            redirect_to end_user_cart_items_path(current_customer)
        end
        @cart_items=current_customer.cart_items.all
        @all_amount=0
    end

    def create
        @cart_item=CartItem.new(cart_params)
        @cart_item.customer_id = current_customer.id

        if current_customer.cart_items.find_by(item_id: @cart_item.item_id)==nil
            @cart_item.save
            redirect_to end_user_cart_items_path(current_customer)
        else
            @cart_item_update=current_customer.cart_items.find_by(item_id: @cart_item.item_id)
            @cart_item_update.update(amount: @cart_item_update.amount+=@cart_item.amount)
            redirect_to end_user_cart_items_path(current_customer)
        end
    end

    def update
        @cart_item=CartItem.find(params[:id])
        @cart_item.update(cart_amount_params)
        redirect_to end_user_cart_items_path(current_customer)
    end

    def destroy
        @cart_item=CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to end_user_cart_items_path(current_customer)
    end

    private
    
    def cart_params
        params.require(:cart_item).permit(:item_id, :amount)
    end

    def cart_amount_params
        params.require(:cart_item).permit(:amount)
    end
end
