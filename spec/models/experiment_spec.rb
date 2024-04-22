require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :scientists}
end