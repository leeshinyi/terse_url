Rails.application.routes.draw do
  get 'links/new'
  post 'links/create'
  
  root 'links#new'
end
