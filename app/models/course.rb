class Course < ApplicationRecord
  has_many :registrations
  has_many :topics, dependent: :destroy
  has_many :users, through: :registrations
  belongs_to :category
end
