require 'bundler/setup'
require 'minitest/autorun'
require 'active_support/testing/declarative'
require 'minitest-activemodel'

class Minitest::Test
  include MiniTest::Matchers::ActiveModel
  extend ActiveSupport::Testing::Declarative
end
