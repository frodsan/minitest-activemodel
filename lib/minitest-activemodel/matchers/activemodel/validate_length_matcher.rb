module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the length of the attribute is validated.
      #
      #   it { must validate_length_of :name }
      def validate_length_of attr
        ValidationMatcher.new attr, :length
      end
    end
  end
end
