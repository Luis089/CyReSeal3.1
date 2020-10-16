class Result < ApplicationRecord
    belongs_to :answer
    belongs_to :question
    belongs_to :customer


  def self.customer_results(customer)
    # give all results a customer scored at any quiz
    self.where(customer_id: customer.id)
  end 

  def self.quiz_results(customer, quiz)
    # gives a list of all results a customer scored at a certain quiz
    customer_results(customer).where(question_id: quiz.question_ids)
  end

  def self.quiz_score(customer, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(customer, quiz).sum do |result|
      result.answer.points
    end
  end

  def self.quiz_score(customer, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(customer, quiz).sum do |result|
      result.answer.points
    end
  end




end
