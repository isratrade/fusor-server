module FusorAnsible
  module Bindings
    class DeployCephBindings < AnsibleTemplateBindings
      def initialize(deployment)
        super(deployment)
      end
    end
  end
end
