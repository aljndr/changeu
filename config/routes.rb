Changeu::Application.routes.draw do
  resources :users


  root :to => 'web_tabs#home'
end
