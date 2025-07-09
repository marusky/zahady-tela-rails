class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def name
  end

  def team
    @player = Player.new(name: name)
    @team_1 = Team.first
    @team_2 = Team.second
  end

  private
    def name
      params.expect(:name)
    end
end
