Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/breweries", to: "breweries#index"
  get "/breweries/new", to: "breweries#new"
  post "/breweries", to: "breweries#create"
  get "/breweries/:id", to: "breweries#show"
  get "/breweries/:id/edit", to: "breweries#edit"
  patch "/breweries/:id", to: "breweries#update"
  delete "/breweries/:id", to: "breweries#destroy"

  get "/breweries/:brewery_id/beers", to: "breweries/beers#index"
  get "/breweries/:brewery_id/beers/new", to: "breweries/beers#new"
  post "/breweries/:brewery_id/beers", to: "breweries/beers#create"

  get "/beers", to: "beers#index"
  get "/beers/:id", to: "beers#show"
  get "/beers/:id/edit", to: "beers#edit"
  patch "/beers/:id", to: "beers#update"
  delete "/beers/:id", to: "beers#destroy"
end
