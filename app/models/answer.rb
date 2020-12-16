class Answer < ApplicationRecord
    belongs_to :question
    has_many :results
    has_many :attempts , through: :results

    validates :points, presence: true
    validates :answer_text, presence: true, :length => {:minimum => 1}


    def method_name
        
    end

end
