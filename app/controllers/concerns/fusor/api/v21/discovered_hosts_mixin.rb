module Fusor::Api::V21
  module DiscoveredHostsMixin
    extend ActiveSupport::Concern

    included do
      include ActionView::Helpers::NumberHelper
      include Fusor::Api::V21::AuthenticationMixin
    end

    def get_discovered_hosts
      connection = get_sat_connection
      json_response = connection.get('api/v2/discovered_hosts')
      results = json_response.body["results"]
      #results.merge!(is_managed: false)
      #results.merge!(is_discovered: true)
      results.each do |dh|
        dh_json2 = connection.get("api/v2/discovered_hosts/#{dh['id']}")
        dh_json = dh_json2.body
        dh['is_managed'] = is_managed(dh_json)
        dh['is_discovered'] = is_discovered(dh_json)
        dh['memory_human_size'] = dh_json['facts_hash']['memorysize']
        dh['disks_human_size'] = disks_human_size(dh_json)
        dh['subnet_to_s'] = nil
        dh['is_virtual'] = dh_json['facts_hash']['is_virtual']
      end

      results
    end


    def is_managed dh_json
      false
    end

    def is_discovered dh_json
      true
    end

    def disks_human_size dh_json
      if is_managed(dh_json)
        dh_json['facts_hash']['blockdevice_vda_size']
      elsif (dh_json)
        return "0 MB" if dh_json['disks_size'].blank? || dh_json['disks_size'].to_i == 0
        number_to_human_size(dh_json['disks_size'].to_i * 1024 * 1024)
      end
    end

  end
end