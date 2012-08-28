module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the length/size of the attribute is validated.
      #
      # Options:
      # * <tt>with_minimum</tt> - the minimum length of the attribute.
      #   Aliased as: <tt>with_min</tt> and <tt>is_at_least</tt>.
      # * <tt>with_maximum</tt> - the maximum length of the attribute.
      #   Aliased as: <tt>with_max</tt> and <tt>is_at_most</tt>.
      # * <tt>within</tt> - the rage specifying the minimum and maximum length
      #   of the attribute. Aliased as: <tt>in</tt>.
      #
      #   it { must validate_length_of :name }
      #   it { must validate_length_of(:name).with_minimum(10) }
      #   it { must validate_length_of(:name).with_min(10) }
      #   it { must validate_length_of(:name).is_at_least(10) }
      #   it { must validate_length_of(:name).with_maximum(100) }
      #   it { must validate_length_of(:name).with_max(100) }
      #   it { must validate_length_of(:name).is_at_most(100) }
      #   it { must validate_length_of(:name).within(10..100) }
      #   it { must validate_length_of(:name).in(10..100) }
      def validate_length_of attr
        ValidateLengthMatcher.new attr
      end
      alias :validate_size_of :validate_length_of
      alias :ensure_length_of :validate_length_of
      alias :ensure_size_of   :validate_length_of

      private

      class ValidateLengthMatcher < ValidationMatcher
        def initialize attr
          super attr, :length
        end

        def with_minimum value
          @minimum = value
          self
        end
        alias :with_min    :with_minimum
        alias :is_at_least :with_minimum

        def with_maximum value
          @maximum = value
          self
        end
        alias :with_max   :with_maximum
        alias :is_at_most :with_maximum

        def within value
          @within = value
          self
        end
        alias :in :within

        def matches? subject
          return false unless @result = super(subject)

          check_minimum if @minimum
          check_maximum if @maximum
          check_range   if @within

          @result
        end

        def description
          desc = []
          desc << " with minimum #{@minimum}" if @minimum
          desc << " with maximum #{@maximum}" if @maximum
          desc << " within range #{@within}"  if @within

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

        def check_maximum
          actual = @validator.options[:maximum]

          if actual == @maximum
            @positive_message << " with maximum of #{actual}"
          else
            @negative_message << " with maximum of #{actual}"
            @result = false
          end
        end

        def check_range
          min, max = @within.min, @within.max
          actual_min = @validator.options[:minimum]
          actual_max = @validator.options[:maximum]

          if actual_min == min && actual_max == max
            @positive_message << " with range #{@within}"
          else
            @negative_message << " with range #{actual_min..actual_max}"
            @result = false
          end
        end
      end
    end
  end
end
