module MiniTest
  module Matchers
    module ActiveModel
      class ValidationMatcher # :nodoc:
        def initialize field, type
          @field = field
          @type  = type
        end

        def matches? subject
          @klass     = subject.is_a?(Class) ? subject : subject.class
          @validator = @klass.validators_on(@field).find { |v| v.kind == @type }
          @result    = true

          check_validator

          @result
        end

        def failure_message
          "Expected #{@klass} to #{description}; instead got #{@negative_message}"
        end

        def negative_failure_message
          "Expected #{@klass} to #{description}; instead got #{@positive_message}"
        end

        private

        def description
          "validate #{@type} of #{@field}"
        end

        def check_validator
          if @validator
            @positive_message = "#{@type} validator for #{@field}"
          else
            @negative_message = "no #{@type} validator for #{@field}"
            @result = false
          end
        end
      end
    end
  end
end
