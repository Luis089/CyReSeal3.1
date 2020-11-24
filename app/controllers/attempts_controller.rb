class AttemptsController < ApplicationController
    def index
        @attempts = Attempt.all
    end
    
    def new
        @attempt = Attempt.new 
    end
    
    def show
        @attempt = Attempt.find(params[:id])
    end
    
    def edit
    end
end
