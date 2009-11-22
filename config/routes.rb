ActionController::Routing::Routes.draw do |map|

  map.resources :gits do |git|
    git.resources :branches do |branch|
      branch.resources :commits
    end
    git.resources :commits
  end

  map.root :controller => "gits"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
