require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe 'relationships' do
    it {should have_many :experiment_scientists}
    it { should have_many(:scientists).through(:experiment_scientists) }
  end

  describe 'instance methods' do
  end
end