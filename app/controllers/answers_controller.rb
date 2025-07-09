class AnswersController < ApplicationController
  def create
    @question = Question.find(answer_params[:question_id])
    Answer.create!(answer_params) if @question.open?

    redirect_to root_path
  end

  private
    def answer_params
      params.expect(answer: [:answer, :question_id])
    end
end
