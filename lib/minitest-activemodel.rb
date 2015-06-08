begin
  require 'minitest/matchers_vaccine'
rescue LoadError
  require 'minitest/matchers'
end
require 'matchers/helpers'
require 'matchers/validation_matcher'
require 'matchers/validate_acceptance_matcher'
require 'matchers/validate_associated_matcher'
require 'matchers/validate_confirmation_matcher'
require 'matchers/validate_exclusion_matcher'
require 'matchers/validate_format_matcher'
require 'matchers/validate_inclusion_matcher'
require 'matchers/validate_length_matcher'
require 'matchers/validate_presence_matcher'
require 'matchers/validate_uniqueness_matcher'
