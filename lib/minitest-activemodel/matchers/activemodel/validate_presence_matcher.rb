module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model is not valid if the given attribute is not present.
      #
      #   it { must validate_presence_of(:name) }
      def validate_presence_of attr
        ValidationMatcher.new attr, :presence
      end
    end
  end
end
