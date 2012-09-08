module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model is not valid if the given attribute is not
      # formatted correctly.
      #
      # Options:
      # * <tt>to_allow</tt> - string to test against that it is valid.
      # * <tt>to_not_allow</tt> - string to test against that it is not valid.
      #
      #   it { must validate_format_of(:email).to_allow('foo@bar.com') }
      #   it { must validate_format_of(:email).to_not_allow('foo_bar_com') }
      def validate_format_of attr
        ValidateFormatMatcher.new attr
      end

      private

      class ValidateFormatMatcher < ValidationMatcher
        def initialize attr
          super attr, :format
        end

        def to_allow valid_value
          @valid = valid_value
          self
        end

        def to_not_allow invalid_value
          @invalid = invalid_value
          self
        end

        def matches? subject
          validate_invalid_options! @valid, @invalid

          return false unless @result = super(subject)

          check_valid_value   if @valid
          check_invalid_value if @invalid

          @result
        end

        def description
          desc = []
          desc << " allowing the value #{@valid.inspect}" if @valid
          desc << " not allowing the value #{@invalid.inspect}" if @invalid
          super << desc.to_sentence
        end

        private

        def check_valid_value
          if format =~ @valid
            @positive_message << " with #{@valid.inspect} as a valid value"
          else
            @negative_message << " with #{@valid.inspect} as an invalid value"
            @result = false
          end
        end

        def check_invalid_value
          if format !~ @invalid
            @positive_message << " with #{@invalid.inspect} as a invalid value"
          else
            @negative_message << " with #{@invalid.inspect} as a valid value"
            @result = false
          end
        end

        def format
          @with ||= @validator.options[:with]
        end
      end
    end
  end
end
