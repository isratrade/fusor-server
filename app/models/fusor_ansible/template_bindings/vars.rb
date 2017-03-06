module FusorAnsible
  module TemplateBindings
    class Vars < Default
      def initialize(deployment)
        super(deployment)

        #TODO implement when model changes are complete
        @rhv_engines = []
        @rhv_hypervisors = []
      end
    end
  end
end
