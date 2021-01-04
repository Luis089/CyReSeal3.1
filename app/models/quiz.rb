class Quiz < ApplicationRecord
    has_many :questions
    has_many :attempts
    has_many :users , through: :attempts

    validates :title, presence: true, :length => {:minimum => 1}
    validates :description, presence: true, :length => {:minimum => 1}

    def role (user)
      attempt = self.attempts.find_by(user_id: user.id)
      if  attempt 
        attempt.role
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


   def attempt(user)
    # returns the attempt object of a user
    self.attempts.find_by(user_id: user.id)
  end

  def assign_attempt(user)
    #method to sign up to this quiz as customer
   Attempt.create(quiz_id: self.id, user_id: user.id, role: "customer")
  end


  def self.all_user_quizzes(user)
    # all quizzes the user partizipated
    self.where(attempts: user.attempts)
  end

  def next_question(user)
  # finds the first question that is unanswered / nil if none found
  user_attempt = attempt(user)
  remaining_ids = self.question_ids - user_attempt.results.pluck(:question_id)
    if !remaining_ids.empty?
    Question.find(remaining_ids.first)
    else
    nil
    end
  end

end



