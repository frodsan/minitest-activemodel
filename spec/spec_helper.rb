gem 'minitest'
require 'minitest/autorun'
require 'minitest-activemodel'

module MiniTest
  class Spec
    include Matchers::ActiveModel
  end
end
