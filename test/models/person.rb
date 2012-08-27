require 'active_model'

class Person
  include ActiveModel::Validations

  validates_presence_of :first_name
  validates_acceptance_of :eula
end
