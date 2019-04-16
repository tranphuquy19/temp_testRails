Rails.application.routes.draw do
  get '/posts/:id/md', to: 'posts#markdown'
  get '/home', to: 'home#show'
  get '/edit', to: 'test_sessions#edit'
  get '/exams', to: 'exams#show'
  post '/test_sessions/update', to: 'test_sessions#update'
  post '/test_sessions/create', to: 'test_sessions#create'
  post '/test_sessions/create_test_paper', to: 'test_sessions#create_test_paper'
  post '/search/:id', to: 'search#index', :as => :search_page
  resources :posts
  resources :tests
  resources :test_sessions
  resources :exams
  root 'home#show', :as => :home_page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'quiz'=>'tests#quiz'
  resources :test
  
end
