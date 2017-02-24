module Fusor::Api::V21
  module AuthenticationMixin
    extend ActiveSupport::Concern

    def get_sat_connection
      Faraday.new Rails.configuration.external_apis['satellite_api_url'] do |conn|
        conn.response :json
        conn.ssl.verify = false
        conn.adapter Faraday.default_adapter
        conn.basic_auth(Rails.configuration.external_apis['satellite_api_username'],
                        Rails.configuration.external_apis['satellite_api_password'])
      end
    end

  end
end