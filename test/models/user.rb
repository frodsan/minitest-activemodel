require 'active_model'

class User
  include ActiveModel::Validations

  validates_acceptance_of :eula
  validates_acceptance_of :terms_of_service, accept: true

  validates_confirmation_of :password

  validates_length_of :name, maximum: 100

  validates_presence_of :name
end
