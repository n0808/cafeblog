Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'users', to: 'users/registrations#new'
  end

  root 'shops#index'
end
