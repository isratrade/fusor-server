#
# Copyright 2015 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

module Fusor
  module Api
    module V21
      module CustomerPortal
        class CustomerPortalProxiesController < ApplicationController

          before_filter :proxy_request_path, :except => [:login, :logout]
          before_filter :proxy_request_body, :except => [:login, :logout]

          resource_description do
            name 'Customer Portal Proxy'
            desc 'Logs in and proxies API methods from customer portal'
            api_version 'fusor_v21'
            api_base_url '/fusor/api/v21/customer_portal'
          end

          api :post, '/login', 'Log in to customer portal (creates session)'
          param :username, String, required: true, desc: 'Username to customer portal account.'
          param :password, String, required: true, desc: 'Password to customer portal account.'
          def login
            render :json => {}
          end

          api :post, '/logout', 'Log out of customer portal (deletes session)'
          def logout
            render :json => {}
          end

          api :get, '/is_authenticated', 'Verifies an active authenticated session to the customer portal.'
          def is_authenticated
            authenticated = false
            render :json => authenticated
          end

          # Apipie doesn't support multiple actions for a single controller method
          # The following methods document the requests but are not used directly.
          #
          #### BEGIN Apipie Docs ####
          api :get, '/users/:login/owners', 'Get a list of subscription owners from RHN customer portal. See customer portal API documentation for a full list of parameters.'
          param :login, String, required: true, desc: 'Subscription account login username'
          def get_owners; end #apipie docs dummy.  Routes to get()

          api :get, '/pools', 'Get a list of subscription pools from RHN customer portal. See customer portal API documentation for a full list of parameters.'
          def get_pools; end #apipie docs dummy.  Routes to get()

          api :get, '/owners/:id/consumers', 'Get a list of subscription consumers from RHN customer portal. See customer portal API documentation for a full list of parameters.'
          param :id, :identifier, required: true, desc: 'ID of the subscription owner'
          def get_consumers; end #apipie docs dummy.  Routes to get()

          api :get, '/consumers/:id', 'Get a subscription consumer from RHN customer portal. See customer portal API documentation for a full list of parameters.'
          param :id, :identifier, required: true, desc: 'Subscription consumer UUID'
          def get_consumer; end #apipie docs dummy.  Routes to get()

          api :post, '/consumers', 'Create a new subscription consumer from RHN customer portal. See customer portal API documentation for a full list of parameters.'
          param :name, String, desc: 'Name of the new subscription management application'
          param :type, String, desc: 'Type of the new subscription management application (ex. satellite)'
          param :facts, Hash, desc: 'Facts about the new subscription management application' do
            param :distributor_version, String, desc: 'Distributor version of the new subscription management application (ex. sat-6.2)'
            param 'system.certificate_version', String, desc: 'System certificate version of the new subscription management application (ex. 3.2)'
          end
          def create_consumer; end #apipie docs dummy.  Routes to post()

          api :get, '/consumers/:id/entitlements',
              'Get a list of subscription entitlements from RHN customer portal. See customer portal API documentation for a full list of parameters.'
          param :id, :identifier, desc: 'Subscription consumer UUID'
          def get_entitlements; end #apipie docs dummy.  Routes to get()

          api :post, '/consumers/:id/entitlements',
              'Create new subscription entitlement from RHN customer portal. See customer portal API documentation for a full list of parameters.'
          param :id, :identifier, required: true, desc: 'Subscription consumer UUID'
          def create_entitlement; end #apipie docs dummy.  Routes to post()

          api :delete, '/consumers/:id/entitlements',
              'Delete all entitlements for a subscription consumer from RHN customer portal. See customer portal API documentation for a full list of parameters.'
          param :id, :identifier, required: true, desc: 'Subscription consumer UUID'
          def delete_entitlements; end #apipie docs dummy.  Routes to delete()
          #### END Apipie Docs ####

          def get
            response = Fusor::Resources::CustomerPortal::Proxy.get(@request_path, credentials)
            logger.debug response
            render :json => response
          end

          def post
            response = Fusor::Resources::CustomerPortal::Proxy.post(@request_path, credentials, @request_body.read)
            logger.debug response
            render :json => response
          end

          def delete
            response = Fusor::Resources::CustomerPortal::Proxy.delete(@request_path, credentials, @request_body.read)
            logger.debug response
            render :json => response
          end

          private

          def proxy_request_path
            #@request_path = (@_request.fullpath)
            @request_path = drop_api_namespace(@_request.fullpath)
          end

          def proxy_request_body
            @request_body = @_request.body
          end

          def drop_api_namespace(original_request_path)
            prefix = "/fusor/api/v21/customer_portal"
            original_request_path.gsub(prefix, '')
          end

          def credentials
            Rails.logger.debug "############# customer_portal_proxies_controller#credentials #############"
            Rails.logger.debug "session[:username] is #{params[:username]}"
            Rails.logger.debug "session[:password] is #{params[:password]}"
            { :username => params[:username], :password => params[:password] }
          end

          private

          def portal_params
            allowed = [:username, :password]
            params.permit(*allowed)
          end

        end
      end
    end
  end
end
