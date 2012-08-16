begin
  require 'rubygems'
  gem 'minitest'
rescue Gem::LoadError
end

require 'minitest/unit'
require 'minitest/mock'
require 'minitest-sugar'
require 'minitest-activemodel'

MiniTest::Unit.autorun

class MiniTest::Unit::TestCase
  include MiniTest::Matchers::ActiveModel
  extend MiniTest::Sugar
end
