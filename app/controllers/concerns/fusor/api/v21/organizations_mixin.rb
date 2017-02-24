module Fusor::Api::V21
  module OrganizationsMixin
    extend ActiveSupport::Concern

    included do
      include Fusor::Api::V21::AuthenticationMixin
    end

    def get_organizations
      connection = get_sat_connection
      json_response = connection.get('katello/api/v2/organizations')
      json_response.body["results"]
    end

    def get_organization(id)
      connection = get_sat_connection
      json_response = connection.get("katello/api/v2/organizations/#{params[:id]}")
      hash = json_response.body
      {id: hash['id'],
       name: hash['name'],
       title: hash['title'],
       label: hash['label'],
       description: hash['description'],
       owner_details: hash['owner_details'],
       created_at: hash['created_at'],
       updated_at: hash['updated_at']
      }
    end

  end
end