Questbox::Application.routes.draw do
  resources :quizzes


  resources :questions
  devise_for :users

  root :to => 'questions#index'
end
