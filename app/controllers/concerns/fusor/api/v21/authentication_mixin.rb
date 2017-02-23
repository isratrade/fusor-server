module Fusor::Api::V21
  module AuthenticationMixin
    extend ActiveSupport::Concern

    #included do
      API_USERNAME = 'admin'
      API_PASSWORD = 'secret'

      SATELLITE_URL = 'http://localhost:9010/'
    #end

  end
end