class Scientist < ApplicationRecord
  validates_presence_of :name,
                        :specialty,
                        :university

  belongs_to :lab
  has_many :experiment_scientists
  has_many :experiments, through: :experiment_scientists
end