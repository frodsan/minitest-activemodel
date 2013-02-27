module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model is invalid if the given
      # association name is not valid itself.
      #
      #   it { must validate_associated(:parent)   }
      #   it { must validate_associated(:children) }
      def validate_associated association_name
        ValidateAssociated.new association_name
      end

      private

      class ValidateAssociated < ValidationMatcher
        def initialize association_name
          super association_name, :associated
        end

        def description
          "validate associated #{@attr.inspect}"
        end
      end
    end
  end
end
