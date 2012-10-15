TurpialSurveys::Application.routes.draw do
  resources :surveys, except: ['destroy', 'update', 'edit']
  match 'stats' => 'surveys#stats'
  root :to => 'surveys#new'
end
