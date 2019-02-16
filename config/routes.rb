require 'crono/web'

Rails.application.routes.draw do
  mount Crono::Web, at: '/crono'
  root to: "welcome#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        get '/journal_entries', to: "journal_entries#show"
        patch '/journal_entries', to: "journal_entries#update"
<<<<<<< HEAD
        get '/calendar', to: "calendar#show"
        resources :journal_entries, only: [:new, :create, :index]
        resources :affirmations, only: [:new, :create, :show, :index]
=======
        get '/calendar_day', to: "calendar_day#show"
        resources :affirmations, only: [:create, :index]
>>>>>>> Add Crono gem to assist with Watson token refresh (future card)
      end
    end
  end

end
