require 'rails_helper'

RSpec.describe Scientist do
  it {should belong_to(:lab)}
  it {should have_many(:scientist_experiements)}
  it {should have_many(:experiments).through(:scientist_experiements)}
end