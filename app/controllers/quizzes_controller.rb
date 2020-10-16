class QuizzesController < ApplicationController
    skip_before_action :authenticated, only: [:index]
   
    def index
      @quizzes = Quiz.all
    end
  
  
    def new
      @questions = Question.all
      @quiz = Quiz.new
    end
  
  
    def auditor_show
      @roles = @quiz.roles
      
      render 'auditor_show'
    end 
  
    def customer_show
      @role = @quiz.role(current_user)
      @user = current_user
      @question = @quiz.next_question(current_user)
      if @question
        render 'customer_show'
      else
        render 'customer_result'
      end
    end
  
  
    def show
      @quiz = Quiz.find(params[:id])
  
      if @quiz.auditor?(current_user)
        auditor_show
      else
        # first visit? enroll as a customer
        if !@quiz.customer?(current_user)
          @quiz.participate(current_user)
        end
        customer_show
      end
  
    end
  
  
    def create
  
      @quiz = Quiz.new(quiz_params)
      @quiz.save
      @quiz.assign_auditor_role(current_user)
      redirect_to quiz_path(@quiz)
      else 
        redirect_to new_quiz_path
      end 
    end 
  
  
  
    def edit
      @quiz = Quiz.find(params[:id])
    end
  
    def update 
      if @quiz.update
        redirect_to quiz_path(@quiz)
      else 
        redirect_to new_quiz_path
      end 
    end 
  
    def quiz_params
      params.require(:quiz).permit(:title , :description ,:question_ids)
    end 
  end
  