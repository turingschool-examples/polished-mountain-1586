require 'rails_helper'

RSpec.describe ExperimentScientist, type: :model do
  describe 'relationships' do
    it {should belong_to :scientist}
    it { should belong_to :experiment }
  end

  describe 'instance methods' do
  end
end