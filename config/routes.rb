# == Route Map
#
#        Prefix Verb   URI Pattern                   Controller#Action
#     questions GET    /questions(.:format)          questions#index
#               POST   /questions(.:format)          questions#create
#  new_question GET    /questions/new(.:format)      questions#new
# edit_question GET    /questions/:id/edit(.:format) questions#edit
#      question GET    /questions/:id(.:format)      questions#show
#               PATCH  /questions/:id(.:format)      questions#update
#               PUT    /questions/:id(.:format)      questions#update
#               DELETE /questions/:id(.:format)      questions#destroy
#

Rails.application.routes.draw do
  root :to => 'questions#index'

  resources :questions do
    resources :answers, :only => [:create, :update, :edit, :destroy], :controller => 'questions/answers'
  end

  get '/users/edit' => 'users#edit'
  resources :users, :only => [:new, :create, :edit, :update, :show]

  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

#  post '/answers' => 'answers#create'
#  post '/answers/:id' => 'answers#update'
#  delete '/answers' => 'answers#delete'

end
