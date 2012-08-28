module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the length/size of the attribute is validated.
      #
      # Options:
      # * <tt>with_minimum</tt> - minimum length of the attribute.
      #   Also, aliased as: <tt>with_min</tt> and <tt>is_at_least</tt>.
      #
      #   it { must validate_length_of :name }
      #   it { must validate_length_of(:name).with_minimum(10) }
      #   it { must validate_length_of(:name).with_min(10) }
      #   it { must validate_length_of(:name).is_at_least(10) }
      def validate_length_of attr
        ValidateLengthMatcher.new attr
      end
      alias :validate_size_of :validate_length_of
      alias :ensure_length_of :validate_length_of
      alias :ensure_size_of   :validate_length_of

      class ValidateLengthMatcher < ValidationMatcher # :nodoc:
        def initialize attr
          super attr, :length
        end

        def with_minimum value
          @minimum = value
          self
        end
        alias :with_min    :with_minimum
        alias :is_at_least :with_minimum

        def matches? subject
          return false unless @result = super(subject)

          check_minimum if @minimum

          @result
        end

        def description
          desc = []
          desc << "with minimum #{@minimum}" if @minimum

          super << desc.to_sentence
        end

        private

        def check_minimum
          actual = @validator.options[:minimum]
          if actual == @minimum
            @positive_message << " with minimum of #{actual}"
          else
            @negative_message << " with minimum of #{actual}"
            @result = false
          end
        end
      end
    end
  end
end
