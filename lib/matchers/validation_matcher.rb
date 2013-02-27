require_relative 'helpers'

module MiniTest
  module Matchers
    module ActiveModel
      class ValidationMatcher # :nodoc:
        include Helpers

        def initialize attr, type
          @attr = attr
          @type = type
          @expected_on = @expected_message = nil
        end

        # TODO: Add documentation.
        def on *contexts
          @expected_on = clean_contexts contexts
          self
        end

        # TODO: Add documentation.
        def with_message expected_message
          @expected_message = expected_message
          self
        end

        def matches? subject
          @klass     = subject.is_a?(Class) ? subject : subject.class
          @validator = @klass.validators_on(@attr).find { |v| v.kind == @type }
          @result    = true

          check_validator
          check_on        if @expected_on
          check_message   if @expected_message

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

        def check_on
          on = clean_contexts @validator.options[:on]

          if on.sort == @expected_on.sort
            @positive_message << " on #{on.empty? ? 'all actions' : to_sentence(on)}"
          else
            @negative_message << " on #{on.empty? ? 'all actions' : to_sentence(on)}"
            @result = false
          end
        end

        def check_message
          error_message = @validator.options[:message]

          if @expected_message == error_message
            @positive_message << " with message: #{error_message.inspect}"
          else
            @negative_message << " with message: #{error_message.inspect}"
            @result = false
          end
        end

        def clean_contexts contexts
          [contexts].flatten.compact.reject { |ctx| ctx == :save }
        end

        # TODO: Document this helper method.
        def validate_invalid_options! *options
          if options.all?(&:nil?)
            raise ArgumentError, 'You have to supply an option for this matcher'
          end
        end
      end
    end
  end
end
