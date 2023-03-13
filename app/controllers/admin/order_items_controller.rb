class Admin::OrderItemsController < ApplicationController
    def index
        @orders=Order.all
    end

    def show
        @order=Order.find(params[:id])
        @ods=@order.order_details.all
    end

    def update
        if params[:flag]=="order"
            @order=Order.find(params[:id])
            @order.update(order_params)
            redirect_to admin_order_item_path(@order.id)
        else
            @order_detail=OrderDetail.find(params[:id])
            @order_detail.update(od_params)
            redirect_to admin_order_item_path(@order_detail.order_id)
        end
    end

    private

    def order_params
        params.require(:order).permit(:status)
    end

    def od_params
        params.require(:order_detail).permit(:production_status)
    end
end
