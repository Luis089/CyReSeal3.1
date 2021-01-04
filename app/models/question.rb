class Question < ApplicationRecord
    belongs_to :quiz
    has_many :answers, dependent: :destroy
    validates :max_points, presence: true
    validates :question_title, presence: true, :length => {:minimum => 1}
    validates :question_text, presence: true, :length => {:minimum => 1}
end