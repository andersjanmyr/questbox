Questbox::Application.routes.draw do
  devise_for :users
  resources :quizzes
  resources :questions, only: [:index, :destroy]
  resources :multiple_choice_questions, except: [:index, :destroy]
  resources :fill_in_the_blanks_questions, except: [:index, :destroy]

  root :to => 'questions#index'
end
