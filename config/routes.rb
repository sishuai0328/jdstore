Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end
  root 'welcome#index'
end
