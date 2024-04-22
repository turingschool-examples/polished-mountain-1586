class Experiment < ApplicationRecord
has_many :scientist_experiements, dependent: :destroy
has_many :scientists, through: :scientist_experiements

  def self.desc_order_by_num_months
    where("num_months >= 6").order("num_months DESC")
  end
end