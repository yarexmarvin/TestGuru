Rails.application.routes.draw do
  get 'tests/index'
  get 'tests/show'
  get 'test/index'
  get 'test/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true
  end

end
