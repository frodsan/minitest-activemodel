module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model is not valid if the given attribute is not accepted.
      #
      #   it { must validate_acceptance_of :eula }
      def validate_acceptance_of attr
        ValidationMatcher.new attr, :acceptance
      end
    end
  end
end
