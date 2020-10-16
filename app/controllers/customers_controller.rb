class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end
    
    def new
        @customer = Customer.new 
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit
    end
end
