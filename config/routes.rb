Rails.application.routes.draw do
  root to: 'home#index'
  post "/urls" => "urls#create"
  get "/:id" => 'urls#show'
end
