Rails.application.routes.draw do
  root "vox_mails#index"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create', as: 'create_session'
  delete 'logout', to: 'sessions#destroy'
  
  post "/anexos", to: "vox_mails#attachments", as: :attachments
end
