class Quiz < ApplicationRecord
    has_many :questions
    has_many :partakers
    has_many :users , through: :partakers

    validates :title, presence: true, :length => {:minimum => 1}
    validates :description, presence: true, :length => {:minimum => 1}

    def role (user)
      partaker = self.partakers.find_by(user_id: user.id)
      if  partaker 
        partaker.role
      else 
        nil
      end 
    end 

    def auditor?(user)
       user_role = self.role(user)
       !!user_role && user_role == "auditor"
    end 

    def customer?(user)
        user_role = self.role(user)
        !!user_role && user_role == "customer"
    end 


   def assign_auditor_role(user)
     # sets user as a auditor upon quiz creation
     Partaker.create(quiz_id: self.id, user_id: user.id, role: "auditor")
   end


   def partaker(user)
    # returns the partaker object of a user
    self.partakers.find_by(user_id: user.id)
  end

  def assign_customer_role(user)
    #method to sign up to this quiz as customer
   Partaker.create(quiz_id: self.id, user_id: user.id, role: "student")
end


  def self.all_user_quizzes(user)
    # all quizzes the user partizipated
    self.where(partakers: user.partakers)
  end

  def next_question(user)
    # hopefully finds the first question that is unanswered / nil if none found
    user_partaker = partaker(user)
    remaining_ids = self.question_ids - user_partaker.results.pluck(:question_id)

   #  user_questions   = user_participant.results.where(question_id: self.questions)
   #  last_question_id = !user_questions.empty? ? user_questions.last.id : -1
   #  outstanding_questions = self.questions.where("id > ?" , last_question_id)
     if !remaining_ids.empty?
       Question.find(remaining_ids.first)
     else
      nil
    end
 end

end
