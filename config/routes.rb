Rails.application.routes.draw do
  resources :messages
  namespace :api do
    namespace :v1 do
      
      get "chat",  to: "chats#show"
      patch "chat" , to: "chats#update"
      post "chat" , to: "chats#create"
      get "chats" , to: "chats#index"


      get "application",  to: "applications#show"
      patch "application" , to: "applications#update"
      post "application" , to: "applications#create"


      get "message",  to: "messages#show"
      patch "message" , to: "messages#update"
      post "message" , to: "messages#create"
      get "messages" , to: "messages#index"
      get "messages/search" , to: "messages#search"


    end
    
  end
  get 'search', to: 'search#search'

  # resources :chats
  # get "application",  to: "api/v1/applications#show"
  # patch "application" , to: "api/v1/applications#update"
  # post "application" , to: "api/v1/applications#create"


  # resources :applications, except:[:show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
