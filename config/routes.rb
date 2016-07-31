Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # To display resque-scheduler tab in web ui app
  require 'resque-scheduler'
  require 'resque/scheduler/server'

  mount Resque::Server, at: 'resque/'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        resource  :sessions, only: [:create, :destroy]
        resource  :profile, only: [:show]
        resources :users, path: 'user', as: 'user', only: [] do
          get :comming_tasks, on: :collection
        end
        resources :archived_tasks, path: 'archive', as: 'archive', only: [] do
          get :search, on: :collection
        end
    end
  end

  match '*all' => 'application#cors', via: :options

end
