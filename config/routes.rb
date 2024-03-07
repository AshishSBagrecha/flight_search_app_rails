Rails.application.routes.draw do
  post "/flights"  , to: "flights#index"
end
