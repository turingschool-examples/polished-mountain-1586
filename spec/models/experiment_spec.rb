require 'rails_helper'

RSpec.describe Experiment, type: :model do
  it {should have_many :scientists}
end
