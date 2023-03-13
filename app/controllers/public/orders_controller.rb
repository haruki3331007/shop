class Public::OrdersController < ApplicationController
    def new
        @order=Order.new
        @all_amount=params[:all_amount]

        @addresses=current_customer.addresses.all

    end

    def create
        @order=Order.new(order_params)
        if (@order.carriage==0)
            @order.postal_code=current_customer.postal_code
            @order.address=current_customer.address
            @order.address_name=(current_customer.last_name)+(current_customer.first_name)
        elsif (@order.carriage==1)
            @order.postal_code=current_customer.addresses.find(@order.customer_id).postal_code
            @order.address=current_customer.addresses.find(@order.customer_id).address
            @order.address_name=current_customer.addresses.find(@order.customer_id).name
        end

        @order.customer_id=current_customer.id
        @order.payment_amount=0
        @order.carriage=800
        @order.save
        redirect_to end_user_order_path(current_customer.id, @order.id)
    end

    def show
        @order=Order.find(params[:id])
        @carts=current_customer.cart_items.all

        @amount=0
    end

    def update
        @order=Order.find(params[:id])
        @order.update(amount_params)

        @carts=current_customer.cart_items.all

        i=0
        @carts.each do |cart|
            order_detail=OrderDetail.new
            order_detail.order_id=@order.id
            order_detail.item_id=cart.item_id
            order_detail.amount=cart.amount
            order_detail.price=cart.item.price
            order_detail.save
        end

        current_customer.cart_items.destroy_all

        render :update 
    end

    private

    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :address, :address_name,:carriage, :customer_id)
    end

    def amount_params
        params.require(:order).permit(:payment_amount)
    end
end

