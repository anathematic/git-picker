ActionController::Routing::Routes.draw do |map|

  map.resources :logs
  map.root :controller => "logs"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
