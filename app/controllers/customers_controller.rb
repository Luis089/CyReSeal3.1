class rolesController < ApplicationController
    def index
        @roles = role.all
    end
    
    def new
        @role = role.new 
    end
    
    def show
        @role = role.find(params[:id])
    end
    
    def edit
    end
end
