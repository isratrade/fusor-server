module FusorAnsible
  module Bindings
    class DeployOpenstackBindings < AnsibleTemplateBindings
      def initialize(deployment)
        super(deployment)
      end
    end
  end
end
