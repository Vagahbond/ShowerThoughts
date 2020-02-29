Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get 'thumbs/', to: 'thumbs#index'
      get 'showerthoughts/',
          to: 'showerthoughts#index'
      get 'showerthoughts/:id',
          to: 'showerthoughts#show'
      get 'showerthoughts/most_popular/:amount',
          to: 'showerthoughts#most_popular'
      get 'showerthoughts/most_commented/:amount',
          to: 'showerthoughts#most_commented'
      get 'showerthoughts/count', to: 'showerthoughts#count'
      get 'showerthoughts/by_comment/:comment_id',
          to: 'showerthoughts#by_comment'
      get 'showerthoughts/by_user/:user_id',
          to: 'showerthoughts#by_user'
      get 'showerthoughts/by_tag/:tag_id',
          to: 'showerthoughts#by_tag'

      get 'comments/',
          to: 'comments#index'
      get 'comments/:id',
          to: 'comment#show'
      get 'comments/by_showerthought/:showerthought_id',
          to: 'comments#by_showerthought'
      get 'comments/by_user/:user_id',
          to: 'comments#by_user'
      post 'showerthoughts',
           to: 'showerthoughts#create'
      post 'showerthoughts/tag',
           to: 'showerthoughts#set_tag'

      post 'comments/',
           to: 'comments#create'

      delete 'showerthoughts/:id',
             to: 'showerthought#destroy'
      delete 'comments/:id',
             to: 'comments#destroy'


      get '/showerthoughts/:id/user' => 'users#user_showerthoughts'
      get '/comments/:id/user' => 'users#user_comment'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
