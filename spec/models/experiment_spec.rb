require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many(:scientist_experiements)}
  it {should have_many(:scientists).through(:scientist_experiements)}
end

describe '.class methods' do
  describe 'self.desc_order_by_num_months' do
    it 'selects only experiments >= 6 months long and orders by descending month length' do
      lab = Lab.create!(name: 'Science Lab')
      scientist1 = lab.scientists.create!(name: 'Nico', specialty: 'Science', university: 'Hard knocks')
      experiment1 = Experiment.create!(name: 'Something weird', objective: 'Create wierdness', num_months: 9)
      experiment2 = Experiment.create!(name: 'Something very weird', objective: 'Create super wierdness', num_months: 3)
      experiment3 = Experiment.create!(name: 'A little too weird', objective: 'Take some weird out', num_months: 11)
      experiment4 = Experiment.create!(name: 'Cannot stop weird', objective: 'Just let the weird happen', num_months: 15)
      experiments = Experiment.all.desc_order_by_num_months
      # require 'pry'; binding.pry

      expect(experiments).to include(experiment1)
      expect(experiments).to include(experiment3)
      expect(experiments).to include(experiment4)

      expect(experiments.first.num_months).to be >= 6
      expect(experiments.order("num_months DESC").to_a).to eq(experiments)
    end
  end
end