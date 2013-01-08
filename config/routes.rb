Changeu::Application.routes.draw do
  resources :users do
  	resources :wishes
  	resources :exchanges
  end


  root :to => 'web_tabs#home'
end
