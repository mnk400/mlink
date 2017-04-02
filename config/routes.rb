Rails.application.routes.draw do
  devise_for :users
  get 'home/home'
  root 'home#home'
  mount Commontator::Engine => '/commontator'
  resources :links do
   member do
     put "like", to: "links#upvote"
     put "dislike", to: "links#downvote"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
end
