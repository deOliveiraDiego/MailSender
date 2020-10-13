Rails.application.routes.draw do
  root "vox_mails#index"
  post "/anexos", to: "vox_mails#attachments", as: :attachments
end
