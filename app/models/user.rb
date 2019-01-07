class User < ApplicationRecord
    has_many :submissions
    has_many :evaluations
end
