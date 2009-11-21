ActionController::Routing::Routes.draw do |map|

  map.resources :gits

  map.root :controller => "gits"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
