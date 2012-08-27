require 'minitest/autorun'
require 'minitest-sugar'
require 'minitest-activemodel'
require 'models/user'

class MiniTest::Unit::TestCase
  include MiniTest::Matchers::ActiveModel
  extend MiniTest::Sugar
end
