# 1.1.0

+ Upgrade to minitest 5
+ Add minitest-matchers_vaccine support
+ Add support for Ruby 2.1 and 2.2

# 1.0.0 - February 27, 2013

+ Add `validate_exclusion_of` matcher.
+ Add `validate_inclusion_of` matcher.
+ Add `validate_associated` matcher.
+ Add `with_message` option to all the matchers.
+ Add `on` option to all the matchers.
+ Add support for activerecord and activemodel 3.2.x, 4.0.0 and edge.
+ Add support for Ruby 1.9.3, 2.0.0, ruby-head, rbx-19mode.
+ Add `validate_uniqueness_of` matcher.
+ Add `scoped_to` option to `validate_uniqueness_of` matcher.
+ Add `case_insensitive` option to `validate_uniqueness_of` matcher.

# 0.0.1 - October 13, 2012

+ Add `validate_presence_of` matcher.
+ Add `validate_acceptance_of` matcher.
+ Add `accepts_with(value)` option to `ValidateAcceptanceMatcher`.
+ Add `validate_confirmation_of` matcher.
+ Add `validate_length_of` matcher.
+ Add `validate_size_of` alias to `validate_length_of`.
+ Add `ensure_length_of` and `ensure_size_of` aliases to `validate_length_of`.
+ Add `with_minimum` option to `ValidateLengthMatcher`.
+ Add `with_min` and `is_at_least` aliases to `ValidateLengthMatcher#with_minimum`.
+ Add `with_maximum` option to `ValidateLengthMatcher`.
+ Add `with_max` and `is_at_most` aliases to `ValidateLengthMatcher#with_maximum`.
+ Add `within` option to `ValidateLengthMatcher`.
+ Add `in` alias to `ValidateLengthMatcher#within`.
+ Raise `ArgumentError` if the given value for `ValidateLengthMatcher#within`
  is not a `Range`.
+ Add `is` option to `ValidateLengthMatcher`.
+ Add `is_equal_to` alias to `ValidateLengthMatcher#is`.
+ Add `validate_format_of` matcher.
+ Raise `ArgumentError` if no option is given for `validate_length_of` matcher.
+ Add `to_allow` and `to_not_allow` options to `ValidateFormatMatcher`.
+ Raise `ArgumentError` if no option is given for `validate_format_of` matcher.
+ Raise error if `to_allow` and `to_not_allow` options are called at once.
