class Public::EndUsersController < ApplicationController

    def show
        @customer=current_customer
    end

    def edit
        @customer=Customer.find(params[:id])
        @customer.update(is_active: true)
    end

    def update
        customer=Customer.find(params[:id])
        customer.update(customer_params)
        redirect_to end_user_path(customer)
    end

    def destroy      
        if params[:active]=="no"
            current_customer.update(is_active: false)
            redirect_to destroy_customer_session_path
        end
    end

    private
    def customer_params
        params.require(:customer).permit(
                                        :first_name, 
                                        :last_name, 
                                        :first_name_kana, 
                                        :last_name_kana, 
                                        :postal_code, 
                                        :address, 
                                        :telephone_number, 
                                        :email
                                        )
    end

end
