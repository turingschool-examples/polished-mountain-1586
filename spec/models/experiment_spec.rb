require 'rails_helper'

RSpec.describe Experiment do
  it { should have_many(:experiment_scientists) }
  it { should have_many(:scientists).through(:experiment_scientists) }
end