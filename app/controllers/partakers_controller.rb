class PartakersController < ApplicationController
    def index
        @partakers = Partaker.all
    end
    
    def new
        @partaker = Partaker.new 
    end
    
    def show
        @partaker = Partaker.find(params[:id])
    end
    
    def edit
    end
end
