Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "home#index"

	get "/home/search", to: "home#search_code"

	get "/home/result", to: "home#result"

end
