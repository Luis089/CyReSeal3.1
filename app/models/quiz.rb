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

    def teacher?(user)
       user_role = self.role(user)
       !!user_role && user_role == "teacher"
    end 

    def student?(user)
        user_role = self.role(user)
        !!user_role && user_role == "student"
    end 


   def assign_teacher_role(user)
     # sets user as a teacher upon quiz creation / does not check for existing student status etc.
     role.create(quiz_id: self.id, user_id: user.id, role: "teacher")
   end

   def participate(user)
        # a user want to role in this quiz and he is not a teacher nor a student, method to sign up to this quiz
       role.create(quiz_id: self.id, user_id: user.id, role: "student")
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
