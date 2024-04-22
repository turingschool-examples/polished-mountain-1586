require 'rails_helper'

RSpec.describe Scientist do
  it {should belong_to :lab}
  it {should have_many :science_experiments}
  it {should have_many(:experiments).through(:science_experiments)}
end