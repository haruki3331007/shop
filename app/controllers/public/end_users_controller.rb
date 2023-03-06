class Public::EndUsersController < ApplicationController
    def show
        @customer=current_customer
    end

    def edit
        @customer=current_customer
        current_customer.update(is_active: true)
    end

    def update
        customer=Customer.find(params[:id])
        customer.update(customer_params)
        redirect_to end_user_path(customer)
    end

    def destroy
        if current_customer.is_active==false 
            current_customer.destroy
            redirect_to root_path
        else
        #current_customer.is_active = false
            current_customer.update(is_active: false)
        end
    end

    private
    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
    end
end
