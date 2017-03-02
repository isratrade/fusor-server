module FusorAnsible
  module Bindings
    class VarsBindings < AnsibleTemplateBindings
      def initialize(deployment)
        super(deployment)
      end
    end
  end
end
