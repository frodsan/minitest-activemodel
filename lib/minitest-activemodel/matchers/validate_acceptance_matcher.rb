module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model is not valid if the given attribute is not accepted.
      #
      # Options:
      # * <tt>accept_with</tt> - value that is considered accepted.
      #
      #   it { must validate_acceptance_of(:eula) }
      #   it { must validate_acceptance_of(:terms_of_service).accept_with(true) }
      def validate_acceptance_of attr
        ValidateAcceptanceMatcher.new attr
      end

      private

      class ValidateAcceptanceMatcher < ValidationMatcher
        def initialize attr
          super attr, :acceptance
        end

        def accept_with value
          @accepted = value
          self
        end

        def matches? subject
          return false unless @result = super(subject)

          check_accepted_value if @accepted

          @result
        end

        def description
          desc = ''
          desc = " accept with #{@accepted.inspect}" if @accepted
          super << desc
        end

        private

        def check_accepted_value
          actual = @validator.options[:accept]

          if actual == @accepted
            @positive_message << " accept with #{actual.inspect}."
          else
            @negative_message << " accept with #{actual.inspect}."
            @result = false
          end
        end
      end
    end
  end
end
