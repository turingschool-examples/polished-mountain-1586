class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :experiments
end