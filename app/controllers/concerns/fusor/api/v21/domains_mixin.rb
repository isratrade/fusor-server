module Fusor::Api::V21
  module DomainsMixin
    extend ActiveSupport::Concern

    included do
      include Fusor::Api::V21::AuthenticationMixin
      API_USERNAME = 'admin'
      API_PASSWORD = 'secret'

      SATELLITE_URL = 'http://localhost:9010/'
    end

    def get_domains
      connection = Faraday.new SATELLITE_URL do |conn|
        conn.response :json
        conn.adapter Faraday.default_adapter
        conn.basic_auth API_USERNAME, API_PASSWORD
      end

      json_response = connection.get('api/v2/domains')
      json_response.body["results"]

    end

    def get_domain(id)
      connection = Faraday.new SATELLITE_URL do |conn|
        conn.response :json
        conn.adapter Faraday.default_adapter
        conn.basic_auth API_USERNAME, API_PASSWORD
      end

      json_response = connection.get("api/v2/domains/#{params[:id]}")
      hash = json_response.body

      {id: hash['id'],
       name: hash['name'],
       fullname: hash['fullname'],
       dns_id: hash['dns_id'],
       created_at: hash['created_at'],
       updated_at: hash['updated_at'],
      }
    end

  end
end
