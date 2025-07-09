module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private
    def authenticate
      if player = Player.find_by(id: cookies.encrypted[:player_id])
        Current.player = player
      else
        redirect_to welcome_name_url
      end
    end

    def login_player(player)
      cookies.encrypted[:player_id] = player.id
    end
end