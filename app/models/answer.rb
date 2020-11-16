class Answer < ApplicationRecord
    belongs_to :question
    has_many :results
    has_many :partakers , through: :results

    validates :points, presence: true
    validates :answer_text, presence: true, :length => {:minimum => 1}
end
