class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards
  has_many :pledges, through: :rewards
  has_many :backers, through: :pledges, source: :user

  accepts_nested_attributes_for :rewards
end
