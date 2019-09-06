Rails.application.routes.draw do
  get "application",  to: "applications#show"
  patch "application" , to: "applications#update"

  # resources :applications, except:[:show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
