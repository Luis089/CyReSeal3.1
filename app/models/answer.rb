class Answer < ApplicationRecord
    belongs_to :question
    has_many :results

    validates :points, presence: true
    validates :answer_text, presence: true, :length => {:minimum => 1}
end
