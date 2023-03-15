Rails.application.routes.draw do
  root "requests#index"

  resources :requests

  devise_for :operators, skip: [:registrations]
  as :operator do
    get "operators/edit" => "devise/registrations#edit", :as => "edit_operator_registration"
    put "operators" => "devise/registrations#update", :as => "operator_registration"
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
end
