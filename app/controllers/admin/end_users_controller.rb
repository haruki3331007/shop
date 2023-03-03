class Admin::EndUsersController < ApplicationController
    def index
        @customer = Customer.all
    end
end
