class PlayersController < ApplicationController
  skip_before_action :authenticate

  def create
    @player = Player.create!(player_params)
    login_player(@player)

    redirect_to root_url
  end

  private
    def player_params
      params.expect(player: [:team_id, :name])
    end
end
