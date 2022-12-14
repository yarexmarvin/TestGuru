Rails.application.routes.draw do
  root to: "tests#index"

  devise_for :users, path: :gurus, path_name: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "users/sessions" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests, only: :index do
    resources :questions, only: :show, shallow: true do
      resources :answers, only: :show, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
      resources :gists, only: %i[create]
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index]
    resources :badges
  end

  resources :feedbacks, only: %i[index create]
  resources :badges, only: %i[index]
  resources :given_badges
end
