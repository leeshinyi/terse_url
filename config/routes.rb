Rails.application.routes.draw do
  get 'links/new'
  post 'links/create'
  get '/:slug', to: 'links#show'
  
  root 'links#new'
end
