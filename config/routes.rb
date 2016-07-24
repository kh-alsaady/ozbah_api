Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # To display resque-scheduler tab in web ui app
  require 'resque-scheduler'
  # require 'resque/scheduler/server'

  mount Resque::Server, at: 'resque/'


  namespace :api, defaults: {format: :json} do
    namespace :v1 do
        resources :sessions, only: [:create, :destroy]
    end
  end

end
