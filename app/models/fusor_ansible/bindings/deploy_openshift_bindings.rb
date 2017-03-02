module FusorAnsible
  module Bindings
    class DeployOpenshiftBindings < AnsibleTemplateBindings
      def initialize(deployment)
        super(deployment)
      end
    end
  end
end
