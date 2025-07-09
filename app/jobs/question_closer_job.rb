class QuestionCloserJob < ApplicationJob
  def perform(question)
    question.closed! if question.open?
  end
end