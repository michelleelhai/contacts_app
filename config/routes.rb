Rails.application.routes.draw do
  get "/contacts" => "contacts#index"
  get "/contacts/new" => "contacts#new"
  get "/contacts/:id" => "contacts#show"
  post "/contacts" => "contacts#create"
  get "/contacts/:id/edit" => "contacts#edit"

  namespace :api do 
    get "/contacts" => "contacts#index"
    get "/contacts/:id" => "contacts#show"
    post "/contacts" => "contacts#create"
    patch "/contacts/:id"=>"contacts#update"
    delete "/contacts/:id" => "contacts#destroy"
    post "/users" => "users#create"
     post "/sessions" => "sessions#create"

  end
end
