# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Change '*' to the specific origins you want to allow

    resource '*', # Change '*' to specify the resources you want to allow cross-origin requests to
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
