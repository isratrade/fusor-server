module FusorAnsible
  module Bindings
    class DeployBindings < AnsibleTemplateBindings
      def initialize(deployment)
        super(deployment)
      end
    end
  end
end
