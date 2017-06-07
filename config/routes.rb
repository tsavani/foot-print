Rails.application.routes.draw do
  root 'foot_traffic_analysis#index'
  # resources :foot_traffic_analysis, only: [:index]
  post 'foot_traffic_analysis/run'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
