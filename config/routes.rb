Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do 
	 	root 'products#index'
    resources :products, only: [:show]
    resources :categories, only: [:show]
		devise_for :users
  end
  namespace :admin do
    root 'products#index'
    resources :products
    resources :categories
  end
  match "*path", to: redirect("/#{I18n.default_locale}/%{path}"), via: :all
  match "", to: redirect("/#{I18n.default_locale}/"), via: :all
end
