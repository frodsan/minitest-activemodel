class Person < ActiveRecord::Base
  validates_uniqueness_of :email, scope: :site, case_sensitive: false
end
