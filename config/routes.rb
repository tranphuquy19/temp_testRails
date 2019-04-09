Rails.application.routes.draw do
  get '/posts/:id/md', to: 'posts#markdown'
  get '/home', to: 'home#show'
  get '/exams', to: 'exams#show'

  resources :posts
  resources :tests
  resources :test_sessions
  resources :exams
  root 'home#show', :as => :home_page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'quiz'=>'tests#quiz'
  resources :test
  
end
