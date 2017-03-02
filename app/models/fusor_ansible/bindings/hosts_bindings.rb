module FusorAnsible
  module Bindings
    class HostsBindings < AnsibleTemplateBindings
      def initialize(deployment)
        super(deployment)
      end
    end
  end
end
