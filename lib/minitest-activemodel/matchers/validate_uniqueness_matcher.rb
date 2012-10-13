module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model is invalid if the given attribute is not unique.
      #
      #   it { must validate_uniqueness_of(:email) }
      def validate_uniqueness_of attr
        ValidationMatcher.new attr, :uniqueness
      end
    end
  end
end
