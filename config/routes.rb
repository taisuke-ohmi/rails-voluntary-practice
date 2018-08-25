Rails.application.routes.draw do
  get 'user/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
end
