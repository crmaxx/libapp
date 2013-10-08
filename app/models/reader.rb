class Reader < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  validates :email, presence: true, uniqueness: true
  #validates :email, email: true
  validates :password, presence: true, confirmation: true
end
