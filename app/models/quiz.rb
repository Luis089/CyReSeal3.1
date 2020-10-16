class Quiz < ApplicationRecord
    has_many :questions
    has_many :roles
    has_many :users , through: :roles

    validates :title, presence: true, :length => {:minimum => 1}
    validates :description, presence: true, :length => {:minimum => 1}

    def role (user)
      role = self.roles.find_by(user_id: user.id)
      if  role 
        role.role
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
     role.create(quiz_id: self.id, user_id: user.id, role: "auditor")
   end

   def role(user)
    # returns the role object of a user
    self.roles.find_by(user_id: user.id)
  end

  def next_question(user)
     # hopefully finds the first question that is unanswered / nil if none found
     user_role = role(user)
     remaining_ids = self.question_ids - user_role.results.pluck(:question_id)

    #  user_questions   = user_role.results.where(question_id: self.questions)
    #  last_question_id = !user_questions.empty? ? user_questions.last.id : -1
    #  outstanding_questions = self.questions.where("id > ?" , last_question_id)
      if !remaining_ids.empty?
        Question.find(remaining_ids.first)
      else
       nil
     end
  end

  def self.all_user_quizzes(user)
    # all quizzes the user partizipated
    self.where(roles: user.roles)
  end


end
