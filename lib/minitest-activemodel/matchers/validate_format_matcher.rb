module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model is not valid if the given attribute is not
      # formatted correctly.
      #
      #   it { must validate_format_of(:email) }
      def validate_format_of attr
        ValidationMatcher.new attr, :format
      end
    end
  end
end
