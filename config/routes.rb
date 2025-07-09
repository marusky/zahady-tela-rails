Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  scope :welcome, controller: :welcome, as: :welcome do
    get :name
    get :team
  end

  scope :questions, controller: :questions, as: :questions do
    patch :open
    patch :close
    patch :evaluate
  end
  resources :answers, only: :create

  resources :players, only: :create
  resource :game, controller: :game, only: :update do
    patch :next_question
    patch :start
    patch :finish
    patch :reset
  end
  resource :admin, controller: :admin, only: :show do
    get :login
    post :become_admin
  end

  root "game#show"
end
