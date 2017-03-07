module FusorAnsible
  module TemplateBindings
    class Hosts < Default
      def initialize(deployment)
        super(deployment)

        #TODO implement when model changes are complete
        # @rhv_engine_fqdn = "#{@deployment.rhev_engine_host.hostname}.#{@satellite_domain}"
        # @rhv_hypervisor_fqdn_list = @deployment.rhev_hypervisor_hosts.map{ |host| "#{host.hostname}.#{@satellite_domain}" }
      end

    end
  end
end
