module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model's attribute matches confirmation.
      #
      #   it { must validate_confirmation_of :password }
      def validate_confirmation_of attr
        ValidationMatcher.new attr, :confirmation
      end
    end
  end
end
