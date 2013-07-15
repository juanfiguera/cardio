Cardio::Application.routes.draw do
  resources :users, :hrm_sessions, :hrm_data_points

  root :to => 'hrm_sessions#index'
end
