class Result < ApplicationRecord
    belongs_to :answer
    belongs_to :question
    belongs_to :role


  def self.role_results(role)
    # give all results scored at any quiz
    self.where(role_id: role.id)
  end 

  def self.quiz_results(role, quiz)
    # gives a list of all results scored at a certain quiz
    role_results(role).where(question_id: quiz.question_ids)
  end

  def self.quiz_score(role, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(role, quiz).sum do |result|
      result.answer.points
    end
  end

  def self.quiz_score(role, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(role, quiz).sum do |result|
      result.answer.points
    end
  end




end
