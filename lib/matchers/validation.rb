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
          validator = @klass.validators_on(@field).find { |v| v.kind == @type }

          validator ? true : false
        end
      end
    end
  end
end
