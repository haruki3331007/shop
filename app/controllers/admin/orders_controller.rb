class Admin::OrdersController < ApplicationController
    def index
        @customer= Customer.find(params[:end_user_id])
        @orders=@customer.orders.all
    end
end
