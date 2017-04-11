class Topic < ApplicationRecord
  belongs_to :course
  has_many :words, dependent: :destroy
  has_many :quizzes
end
