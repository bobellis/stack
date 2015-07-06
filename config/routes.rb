Rails.application.routes.draw do
get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new"
post"log_in", to: "sessions#create"
get "sign_up" => "users#new", :as => "sign_up"

root :to => "users#new"

resources :users
end
