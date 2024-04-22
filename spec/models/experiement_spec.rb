require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many :scientist_experiments}
  it {should have_many(:scientists).through(:scientist_experiments)}

  describe "class methods" do
    it "#oldest_list" do
      @lab = Lab.create!(name: "Fermilab")

      @marie = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
      @darwin = @lab.scientists.create!(name: "Chuck Darwin", specialty: "Bird Beaks", university: "Galapagos Islands")

      @minerva = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
      @exp2 = Experiment.create!(name: "Nobel Prize Idea", objective: "Something super duper smart", num_months: 4)
      @exp3 = Experiment.create!(name: "Accredidate Husband's name", objective: "Table of Elements Creation", num_months: 7)
      @exp4 = Experiment.create!(name: "Make Friends", objective: "Befriend Jane Goodall and Primates", num_months: 57)
      expect(Experiment.oldest_list).to eq([@exp4, @exp3])
    end
  end
end