class ApplicationController < ActionController::Base
  if Rails.env.production?
    Rails.application.routes.default_url_options = { host: "radiant-gorge-16116.herokuapp.com", protocol: 'https' }
  else
    Rails.application.routes.default_url_options = { host: 'localhost:3000', protocol: 'http' }
  end
end
