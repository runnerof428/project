class Submission < ApplicationRecord
  belongs_to :User
  belongs_to :Genre
  has_many :evaluations
end
