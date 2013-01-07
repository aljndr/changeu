Changeu::Application.routes.draw do
  resources :users do
  	resources :wishes
  end


  root :to => 'web_tabs#home'
end
