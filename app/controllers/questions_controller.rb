class QuestionsController < ApplicationController
  before_action :is_admin?, only: [:new, :edit, :destroy]
  def show
    @question = Question.find(params[:id])
  end
        
 # def new
    # @quizzes = Quiz.all
   # @question = Question.new
  # end
  
def new
  @question = Question.new
end


  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to request.referrer
    else 
       flash[:errors] = @question.errors.full_messages
      redirect_to request.referrer
     end
  end
      
  def edit
    @quizzes = Quiz.all
    @question = Question.find(params[:id])
  end
      
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
       redirect_to quizzes_path
    else 
      flash[:errors] = @question.errors.full_messages
      redirect_to request.referrer
    end 
  end 

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
         redirect_to quizzes_path , notice: "Frage wurde gelöscht."
    end
  end
  
      
  def question_params
    params.require(:question).permit(:question_title, :question_text, :quiz_id, :max_points)
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
end
