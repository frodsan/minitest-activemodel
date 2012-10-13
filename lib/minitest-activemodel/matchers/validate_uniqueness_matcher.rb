module MiniTest
  module Matchers
    module ActiveModel
      # Ensures that the model is invalid if the given attribute is not unique.
      #
      # Options:
      # * <tt>scoped_to</tt> - field(s) to scope the uniqueness to.
      # * <tt>case_insensitive</tt> - ensures that the validation doesn't
      #   check case. Off by default. Ignored by non-text attributes.
      #
      #   it { must validate_uniqueness_of(:email) }
      #   it { must validate_uniqueness_of(:email).scoped_to(:name) }
      #   it { must validate_uniqueness_of(:email).scoped_to(:first_name, :last_name) }
      #   it { must validate_uniqueness_of(:keyword).case_insensitive }
      def validate_uniqueness_of attr
        ValidateUniquenessMatcher.new attr
      end

      private

      class ValidateUniquenessMatcher < ValidationMatcher
        def initialize attr
          @scope = nil
          @case_insensitive = false

          super attr, :uniqueness
        end

        def scoped_to *scope
          @scope = [scope].flatten.map(&:to_s)
          self
        end

        def case_insensitive
          @case_insensitive = true
          self
        end

        def matches? subject
          return false unless @result = super(subject)

          check_scope if @scope
          check_case_sensivity if @case_insensitive

          @result
        end

        def description
          desc = []
          desc  << " scoped to #{to_sentence(@scope)}" if @scope
          desc << ' allowing case insensitive values'  if @case_insensitive
          super << desc.to_sentence
        end

        private

        def check_scope
          actual_scope = [@validator.options[:scope]].flatten.map(&:to_s)
          message = " scoped to #{to_sentence(actual_scope)}"

          if actual_scope == @scope
            @positive_message << message
          else
            @negative_message << message
            @result = false
          end
        end

        def check_case_sensivity
          if @validator.options[:case_sensitive] == false
            @positive_message << ' with case insensitive values'
          else
            @negative_message << ' without case insensitive values'
            @result = false
          end
        end
      end
    end
  end
end
