class Game < ApplicationRecord
  broadcasts_refreshes

  has_one :question

  enum :state, {
    prepared: 0,
    started: 1,
    finished: 2
  }

  def next_question
    if next_question = Question.find_by(id: question.id.next)
      update(question: next_question)
    end
  end

  def reset!
    transaction do
      Answer.delete_all
      Player.delete_all
      Question.update_all(state: :prepared)
      Team.update_all(points: 0)
      update!(question: Question.first, state: :prepared)
    end
  end
end
