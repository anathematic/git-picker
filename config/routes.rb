ActionController::Routing::Routes.draw do |map|

  map.resources :gits do |git|
    git.resources :branches
  end

  map.root :controller => "gits"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
