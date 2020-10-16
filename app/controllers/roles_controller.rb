class identitiesController < ApplicationController
    def index
        @identities = identity.all
    end
    
    def new
        @identity = identity.new 
    end
    
    def show
        @identity = identity.find(params[:id])
    end
    
    def edit
    end
end
