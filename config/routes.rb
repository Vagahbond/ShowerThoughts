Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :comments
      resources :taggeds
      resources :tags
      resources :thumbs
      resources :showerthoughts
      resources :users
      get '/comments/:id/user' => 'users#user_comment'
      get '/showerthoughts/:id/user' => 'users#user_showerthoughts'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
