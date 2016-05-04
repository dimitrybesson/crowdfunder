class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  has_many :pledges
end
