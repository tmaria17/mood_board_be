Rails.application.routes.draw do
  root to: "welcome#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        get '/journal_entries', to: "journal_entries#show"
        post '/journal_entries', to: "journal_entries#update"
        resources :journal_entries, only: [:new, :create, :index]
        resources :affirmations, only: [:new, :create, :show, :index]
      end
    end
  end

end
