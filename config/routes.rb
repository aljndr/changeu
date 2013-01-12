Changeu::Application.routes.draw do

  root :to => 'web_tabs#home'

  resources :users do
  	resources :wishes
  	resources :exchanges
  end

  resources :exchanges do
  	match '/participantes', to: 'exchanges#participantes'
  	match '/invitar', to: 'exchanges#invitar'
    match '/aceptar', to: 'exchanges#aceptar'
    match '/rechazar', to: 'exchanges#rechazar'
    match '/sortear', to: 'exchanges#sortear'
    match '/sacar/:exchanging', to: 'exchanges#sacar', as: :sacar
  end

  match '/login', to: 'web_tabs#login'
  match '/logout', to: 'web_tabs#logout'
  match '/verify', to: 'web_tabs#verify'

  match '/wishlist/:user_id', to: 'users#wishlist', as: :wishlist

end
