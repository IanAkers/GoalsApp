GoalApp::Application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :goals
  resources :user_comments, :only => [:new, :create]
  resources :goal_comments, :only => [:new, :create]
end
