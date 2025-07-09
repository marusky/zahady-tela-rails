class QuestionsController < ApplicationController
  include SetGame
  include AdminAuthentication

  skip_before_action :authenticate

  def open
    @game.question.open!

    redirect_to admin_url
  end

  def close
    @game.question.closed!

    redirect_to admin_url
  end

  def evaluate
    @game.question.evaluated!

    redirect_to admin_url
  end
end
