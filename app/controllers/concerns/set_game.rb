module SetGame
  extend ActiveSupport::Concern

  included do
    before_action :set_game
  end

  private
    def set_game
      @game = Game.first
    end
end