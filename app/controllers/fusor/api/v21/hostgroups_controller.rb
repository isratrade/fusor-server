class Fusor::Api::V21::HostgroupsController < ApplicationController

  #include Api::Version21

  def index
    #TODO - change from hardcode
    render json: {"hostgroups": [
            {
                "id": 1,
                "name": "Fusor Base",
                "title": "Fusor Base",
                "parent_id": nil,
                "created_at": "2016-04-20T11:10:03.627Z",
                "updated_at": "2016-04-20T11:16:16.055Z",
                "location_ids": [],
                "organization_ids": [],
                "puppetclass_ids": [],
                "config_group_ids": [],
                "domain_id": 2,
                "subnet_id": nil
            }
        ],
        "domains": [
            {
                "id": 2,
                "name": "example.com",
                "fullname": "",
                "dns_id": nil,
                "created_at": "2016-04-20T11:16:02.447Z",
                "updated_at": "2016-04-20T11:16:02.447Z"
            }
        ]
    }
  end

  def show
    #TODO - change from hardcode
    render json: {
        "hostgroup": {
            "id": 1,
            "name": "Fusor Base",
            "title": "Fusor Base",
            "parent_id": nil,
            "created_at": "2016-04-20T11:10:03.627Z",
            "updated_at": "2016-04-20T11:16:16.055Z",
            "location_ids": [],
            "organization_ids": [],
            "puppetclass_ids": [],
            "config_group_ids": [],
            "domain_id": 2,
            "subnet_id": nil
        },
        "locations": [],
        "organizations": [],
        "puppetclasses": [],
        "config_groups": [],
        "domains": [
            {
                "id": 2,
                "name": "example.com",
                "fullname": "",
                "dns_id": nil,
                "created_at": "2016-04-20T11:16:02.447Z",
                "updated_at": "2016-04-20T11:16:02.447Z"
            }
        ],
        "subnets": []
    }
  end

end
