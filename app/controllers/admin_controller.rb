class AdminController < ApplicationController
  include SetGame
  include AdminAuthentication

  skip_before_action :authenticate
  skip_before_action :admin_authenticate, only: [:login, :become_admin]

  def show
    @team_1 = Team.first
    @team_2 = Team.second
    @questions = Question.order(:id)
  end

  def login
  end

  def become_admin
    login_admin params[:password]

    redirect_to admin_url
  end
end
