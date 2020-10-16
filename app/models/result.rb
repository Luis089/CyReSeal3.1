class Result < ApplicationRecord
    belongs_to :answer
    belongs_to :question
    belongs_to :identity


  def self.identity_results(identity)
    # give all results scored at any quiz
    self.where(identity_id: identity.id)
  end 

  def self.quiz_results(identity, quiz)
    # gives a list of all results scored at a certain quiz
    identity_results(identity).where(question_id: quiz.question_ids)
  end

  def self.quiz_score(identity, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(identity, quiz).sum do |result|
      result.answer.points
    end
  end

  def self.quiz_score(identity, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(identity, quiz).sum do |result|
      result.answer.points
    end
  end




end
