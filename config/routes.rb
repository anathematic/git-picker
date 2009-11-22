ActionController::Routing::Routes.draw do |map|

  map.resources :gits do |git|
    git.resources :branches do |commit|
      commit.resources :commits
    end
  end

  map.root :controller => "gits"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
