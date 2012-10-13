require 'minitest/autorun'
require 'active_support/testing/declarative'
require 'minitest-activemodel'

class MiniTest::Unit::TestCase
  include MiniTest::Matchers::ActiveModel
  extend ActiveSupport::Testing::Declarative
end
