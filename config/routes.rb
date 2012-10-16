TurpialSurveys::Application.routes.draw do
  resources :surveys, :except => ['destroy', 'update', 'edit', 'show']
  match 'stats' => 'surveys#stats'
  root :to => 'surveys#new'


  match '/world-domination' => 'surveys#new'
  match '/world-domination/surveys' => 'surveys#create'
  match '/world-domination/stats' => 'surveys#stats'
end
