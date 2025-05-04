Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  post "users/signup", to: "users#signup"
  post "users/signin", to: "users#signin"
  get "users/details", to: "users#get_user_details"

  get "rewards/list", to: "rewards#get_rewards"
  get "redemptions/list", to: "redemptions#get_redemptions"
  get "earned_points/list", to: "earned_points#get_point_histories"

  post "redemptions/purchase", to: "redemptions#purchase"
end
