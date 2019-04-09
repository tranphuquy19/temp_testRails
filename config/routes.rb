Rails.application.routes.draw do
  get '/posts/:id/md', to: 'posts#markdown'
  resources :posts
  resources :tests
  root 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'quiz'=>'tests#quiz'
  resources :test
  
end
