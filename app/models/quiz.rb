class Quiz < ApplicationRecord
    has_many :questions
    has_many :customers
    has_many :users , through: :customers

    validates :title, presence: true, :length => {:minimum => 1}
    validates :description, presence: true, :length => {:minimum => 1}

    def role (user)
      customer = self.customers.find_by(user_id: user.id)
      if  customer 
        customer.role
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
     customer.create(quiz_id: self.id, user_id: user.id, role: "teacher")
   end

   def participate(user)
        # a user want to customer in this quiz and he is not a teacher nor a student, method to sign up to this quiz
       customer.create(quiz_id: self.id, user_id: user.id, role: "student")
   end

   def customer(user)
    # returns the customer object of a user
    self.customers.find_by(user_id: user.id)
  end

  def next_question(user)
     # hopefully finds the first question that is unanswered / nil if none found
     user_customer = customer(user)
     remaining_ids = self.question_ids - user_customer.results.pluck(:question_id)

    #  user_questions   = user_customer.results.where(question_id: self.questions)
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
    self.where(customers: user.customers)
  end


end
