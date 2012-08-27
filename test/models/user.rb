require 'active_model'

class User
  include ActiveModel::Validations

  validates_presence_of :name

  validates_acceptance_of :eula
  validates_acceptance_of :terms_of_service, accept: true
end
