require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :science_experiments}
  it {should have_many(:scientists).through(:science_experiments)}
end