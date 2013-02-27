class Person < ActiveRecord::Base
  has_many :posts

  validates_uniqueness_of :email, scope: :site, case_sensitive: false
  validates_associated :posts
end
