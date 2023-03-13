class Public::OrderItemsController < ApplicationController
    def index
        @orders=current_customer.orders.all
    end

    def show
        @order=Order.find(params[:id])
        @ods=@order.order_details.all
    end
end
