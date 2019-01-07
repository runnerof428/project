class Genre < ApplicationRecord
  belongs_to :Subject
  has_many :submissions
end
