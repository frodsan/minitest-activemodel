module MiniTest
  module Matchers
    module ActiveModel
      # TODO: Add documentation.
      def validate_inclusion_of attr
        ValidateInclusionMatcher.new attr
      end

      private

      class ValidateInclusionMatcher < ValidationMatcher
        def initialize attr
          super attr, :inclusion
        end

        def to_allow *values
          @allowed_values = (values.length > 1) ? values.flatten : values[0]
          self
        end

        def matches? subject
          return false unless result = super(subject)

          if Array === @allowed_values
            not_allowed_values = @allowed_values - @validator.options[:in].to_a
            if not_allowed_values.empty?
              @positive_message << ' allowing all values mentioned'
            else
              @negative_message << ' not allowing the following the values:'
              @negative_message << " #{not_allowed_values.inspect}"
              result = false
            end
          elsif @allowed_values
            if @allowed_values == @validator.options[:in]
              @positive_message << " allowing values in #{@allowed_values.inspect}"
            else
              @negative_message << " allowing values in #{@validator.options[:in].inspect}"
              result = false
            end
          end

          result
        end

        def description
          if Array === @allowed_values
            super << " allowing the values: #{to_sentence(@allowed_values)}"
          elsif @allowed_values
            super << " allowing the values in #{@allowed_values.inspect}"
          end
        end
      end
    end
  end
end
