module MiniTest
  module Matchers
    module ActiveModel
      class ValidationMatcher # :nodoc:
        def initialize attr, type
          @attr = attr
          @type = type
        end

        def matches? subject
          @klass     = subject.is_a?(Class) ? subject : subject.class
          @validator = @klass.validators_on(@attr).find { |v| v.kind == @type }
          @result    = true

          check_validator

          @result
        end

        def failure_message
          "Expected #{@klass} to #{description}; instead got #{@negative_message}"
        end

        def negative_failure_message
          "Expected #{@klass} to not #{description}; instead got #{@positive_message}"
        end

        def description
          "validate #{@type} of #{@attr}"
        end

        private

        def check_validator
          if @validator
            @positive_message = "#{@type} validator for #{@attr}"
            @negative_message = "#{@type} validator for #{@attr}"
          else
            @negative_message = "no #{@type} validator for #{@attr}"
            @result = false
          end
        end

        def validate_invalid_options! *options
          if options.all?(&:nil?)
            raise ArgumentError, 'You have to supply an option for this matcher'
          end
        end
      end
    end
  end
end
