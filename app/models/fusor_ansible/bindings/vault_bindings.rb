module FusorAnsible
  module Bindings
    class VaultBindings < AnsibleTemplateBindings
      def initialize(deployment)
        super(deployment)
      end
    end
  end
end
