Questbox::Application.routes.draw do
  devise_for :users
  resources :quizzes
  resources :questions

  root :to => 'questions#index'
end
