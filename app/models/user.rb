class User < ApplicationRecord
  validates_uniqueness_of :email, :message => "this email has already been taken"
  validates_presence_of :email, :password, :name
end
