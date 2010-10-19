Lighthouseapp::Application.routes.draw do
  match '/tickets/:id', :to => 'tickets#show'
  
  root :to => "milestone#index"
  
end
