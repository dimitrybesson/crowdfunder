class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  has_many :pledges
  has_many :rewards, through: :pledges
  has_many :backed_projects, through: :rewards, source: :project

  def full_name
    "#{first_name} #{last_name}"
  end
end

# has_many :backed_projects, :through => :rewards, :source => <name>'
