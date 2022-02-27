Rails.application.routes.draw do
  resource :devs, only: [:show]
  root "devs#show"
end
