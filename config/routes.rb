GoalApp::Application.routes.draw do

  resources :users, only: [:new, :create, :show] do
    resources :user_comments, :only => [:new]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :goals do
    resources :goal_comments, only: [:new]
  end

  resources :user_comments, :only => [:create]
  resources :goal_comments, :only => [:create]
end
