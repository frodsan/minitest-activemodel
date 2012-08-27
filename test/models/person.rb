require 'active_model'

class Person
  include ActiveModel::Validations

  validates_presence_of :first_name

  validates_acceptance_of :eula
  validates_acceptance_of :terms_of_service, accept: true
end
