module Fusor::Api::V21
  module HostgroupsMixin
    extend ActiveSupport::Concern

    included do
      include Fusor::Api::V21::AuthenticationMixin
    end

    def get_hostgroups
      connection = get_sat_connection
      json_response = connection.get('api/v2/hostgroups')
      json_response.body["results"]

    end

    def get_hostgroup(id)
      connection = get_sat_connection

      json_response = connection.get("api/v2/hostgroups/#{params[:id]}")
      hash = json_response.body

      {id: hash['id'],
       name: hash['name'],
       title: hash['title'],
       label: hash['label'],
       parent_id: hash['parent_id'],
       created_at: hash['created_at'],
       updated_at: hash['updated_at'],
       location_ids: hash['location_ids'],
       organization_ids: hash['organization_ids'],
       puppetclass_ids: hash['puppetclass_ids'],
       config_group_ids: hash['config_group_ids'],
       domain_id: hash['domain_id'],
       subnet_id: hash['subnet_id']
      }
    end

  end
end
