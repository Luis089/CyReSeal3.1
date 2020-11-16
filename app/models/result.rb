class Result < ApplicationRecord
    belongs_to :answer
    belongs_to :question
    belongs_to :partaker


  def self.partaker_results(partaker)
    # give all results scored at any quiz
    self.where(partaker_id: partaker.id)
  end 

  def self.quiz_results(partaker, quiz)
    # gives a list of all results scored at a certain quiz
    partaker_results(partaker).where(question_id: quiz.question_ids)
  end

  def self.quiz_score(partaker, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(partaker, quiz).sum do |result|
      result.answer.points
    end
  end
end
