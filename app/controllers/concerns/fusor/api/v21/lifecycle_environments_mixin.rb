module Fusor::Api::V21
  module LifecycleEnvironmentsMixin
    extend ActiveSupport::Concern

    included do
      include Fusor::Api::V21::AuthenticationMixin
      API_USERNAME = 'admin'
      API_PASSWORD = 'secret'

      SATELLITE_URL = 'http://localhost:9010/'
    end

    def get_lifecycle_environments
      connection = Faraday.new SATELLITE_URL do |conn|
        conn.response :json
        conn.adapter Faraday.default_adapter
        conn.basic_auth API_USERNAME, API_PASSWORD
      end

      # TODO - remove hardcode of ?organization_id=1
      json_response = connection.get('katello/api/v2/environments?organization_id=1')
      json_response.body["results"].map do |hash|
        {id: hash['id'],
         name: hash['name'],
         label: hash['label'],
         description: hash['description'],
         library: hash['library'],
         prior_id: hash['prior_id']
         }
      end
    end

    def get_lifecycle_environment(id)
      connection = Faraday.new SATELLITE_URL do |conn|
        conn.response :json
        conn.adapter Faraday.default_adapter
        conn.basic_auth API_USERNAME, API_PASSWORD
      end

      # TODO - remove hardcode of ?organization_id=1
      json_response = connection.get("katello/api/v2/environments/#{params[:id]}?organization_id=1")
      hash = json_response.body
      {id: hash['id'],
       name: hash['name'],
       label: hash['label'],
       description: hash['description'],
       library: hash['library'],
       prior_id: hash['prior_id']
      }
    end

  end
end