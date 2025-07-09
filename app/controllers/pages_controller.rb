class PagesController < ApplicationController
  def index
    @question = Question.first
    @answer = Answer.new
  end
end
