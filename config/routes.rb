Changeu::Application.routes.draw do

  root :to => 'web_tabs#home'

  resources :users do
  	resources :wishes
  	resources :exchanges
  end

  resources :exchanges do
  	match '/participantes', to: 'exchanges#participantes'
  	match '/invitar', to: 'exchanges#invitar'
  end

  match '/login', to: 'web_tabs#login'
  match '/logout', to: 'web_tabs#logout'
  match '/verify', to: 'web_tabs#verify'

end
