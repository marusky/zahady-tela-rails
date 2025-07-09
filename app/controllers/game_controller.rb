class GameController < ApplicationController
  include SetGame
  include AdminAuthentication

  skip_before_action :authenticate, except: :show
  skip_before_action :admin_authenticate, only: :show

  def show
    @question = Current.question
    @answer = Answer.find_or_initialize_by(player: Current.player, question: @question)
  end

  def update
    @game.update(game_params)

    redirect_to admin_url
  end

  def start
    @game.started!

    redirect_to admin_url
  end

  def finish
    @game.finished!

    redirect_to admin_url
  end

  def reset
    @game.reset!

    redirect_to admin_url
  end

  def next_question
    @game.next_question

    redirect_to admin_url
  end
end
