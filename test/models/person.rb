require 'active_model'

class Person
  include ActiveModel::Validations

  attr_accessor :first_name

  validates_presence_of :first_name
end
