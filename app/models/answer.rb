class Answer < ApplicationRecord
    belongs_to :question
    has_many :results
    has_many :attempts , through: :results
    validates :points, presence: true
    validates :answer_text, presence: true, :length => {:minimum => 1}

#    def points_cannot_be_greater_than_max_points
#     @question = Question.find(params[:id])
#     if answer.points > @question.answer.max_points
#       flash[:errors] = answer.errors.full_messages
#     end
#   end
end
