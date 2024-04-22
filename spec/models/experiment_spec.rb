require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many(:scientist_experiements)}
  it {should have_many(:scientists).through(:scientist_experiements)}
end