Rails.application.routes.draw do
  # get 'home/index'
  root 'home#index'
  get 'home/prices'
  post 'home/prices' => 'home/prices'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

