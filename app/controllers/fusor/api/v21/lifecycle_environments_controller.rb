class Fusor::Api::V21::LifecycleEnvironmentsController < ApplicationController

  #include Api::Version21

  def index
    render json: {"lifecycle_environments": [
      {
        "id": 1,
        "name": "Library",
        "label": "Library",
        "description": nil,
        "library": true,
        "prior_id": nil,
        "prior": nil,
        "created_at": "2015-11-05T08:40:34Z",
        "updated_at": "2015-11-05T08:40:34Z"
      }
    ]}
  end

  def show
    render json: {"lifecycle_environment":
      {
        "id": 1,
        "name": "Library",
        "label": "Library",
        "description": nil,
        "library": true,
        "prior_id": nil,
        "prior": nil,
        "created_at": "2015-11-05T08:40:34Z",
        "updated_at": "2015-11-05T08:40:34Z"
      }
    }
  end

  def create
    #todo
  end

end
