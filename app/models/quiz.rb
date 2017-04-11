class Quiz < ApplicationRecord
  has_many :quiz_questions
  belongs_to :topic
end
