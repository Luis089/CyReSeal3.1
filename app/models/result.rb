class Result < ApplicationRecord
    resourcify
    belongs_to :answer
    belongs_to :question
    belongs_to :attempt

  def self.attempt_results(attempt)
    # give all results scored at any quiz
    self.where(attempt_id: attempt.id)
  end 

  def self.quiz_results(attempt, quiz)
    # gives a list of all results scored at a certain quiz
    attempt_results(attempt).where(question_id: quiz.question_ids)
  end

  def self.quiz_score(attempt, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(attempt, quiz).sum do |result|
      result.answer.points
    end
  end

end
