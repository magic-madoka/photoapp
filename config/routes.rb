Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :attachments

  root 'welcome#home'
end
