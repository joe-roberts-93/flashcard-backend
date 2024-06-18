Rails.application.config.middleware.insert_before 0, Rack::Cors do

  # Allow cross-origin requests to the API


  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
