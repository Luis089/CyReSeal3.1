class QuizzesController < ApplicationController
  before_action :is_admin?, only: [:new, :edit, :destroy]
   
  def index
    @quizzes = Quiz.paginate(page: params[:page], per_page: 3)
  end
  
  
  def new
    @quiz = Quiz.new
    @questions = @quiz.questions.build
  end
  
  
  def auditor_show
     @attempts = @quiz.attempts
    render 'auditor_show'
  end 
  
  def customer_show
     @attempt = @quiz.attempt(current_user)
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
    if current_user.has_role? :Admin || :Auditor
        auditor_show
    else
       if !@quiz.customer?(current_user)
        @quiz.assign_attempt(current_user)
       end
      customer_show
    end
  end

  def create
     @quiz = Quiz.new(quiz_params)
     @quiz.save
     # @quiz.assign_attempt(current_user)
     redirect_to quiz_path(@quiz)
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

   def destroy
    @quiz = Quiz.find(params[:id])
    if @quiz.destroy
         redirect_to root_path, notice: "Quiz wurde gelöscht."
    end
  end
  
  def quiz_params
    params.require(:quiz).permit(:title , :description ,:question_ids)
  end 

  private

  def is_admin?
      # check if user is a admin
      if current_user.has_role? :Admin
      else
        flash[:alert] = "Dieser Bereich benötigt Adminrechte."
      redirect_to root_path unless current_user.has_role? :Admin
      end
  end

  def is_auditor?
    if current_user.has_role? :Admin
    else
      # check if user is a auditor
      flash[:alert] = "Dieser Bereich benötigt eine höhere Berechtigung."
      redirect_to root_path  unless current_user.has_role? :Auditor
    end
  end
end