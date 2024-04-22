require 'rails_helper'

RSpec.describe Scientist do
  it {should belong_to :lab}
  it {should have_many :scientist_experiments}
  it {should have_many(:experiments).through(:scientist_experiments)}

  describe "class methods" do
    it ".experiments_ordered" do
      @lab = Lab.create!(name: "Fermilab")

      @marie = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
      @husband = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
      @darwin = @lab.scientists.create!(name: "Chuck Darwin", specialty: "Bird Beaks", university: "Galapagos Islands")

      @minerva = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
      @exp2 = Experiment.create!(name: "Nobel Prize Idea", objective: "Something super duper smart", num_months: 4)
      @exp3 = Experiment.create!(name: "Accredidate Husband's name", objective: "Table of Elements Creation", num_months: 4)
      @exp4 = Experiment.create!(name: "Make Friends", objective: "Befriend Jane Goodall and Primates", num_months: 57)
      
      @marie.experiments << [@minerva, @exp2, @exp3, @exp4]
      @darwin.experiments << @exp4
      @husband.experiments << [@minerva, @exp2, @exp4]

      expect(Scientist.experiments_ordered).to eq(@marie, @husband, @darwin)
    end
  end

  # describe "instance methods" do
  #   it "#num_experiments" do
  #     @lab = Lab.create!(name: "Fermilab")

  #     @marie = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
  #     @husband = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
  #     @darwin = @lab.scientists.create!(name: "Chuck Darwin", specialty: "Bird Beaks", university: "Galapagos Islands")

  #     @minerva = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
  #     @exp2 = Experiment.create!(name: "Nobel Prize Idea", objective: "Something super duper smart", num_months: 4)
  #     @exp3 = Experiment.create!(name: "Accredidate Husband's name", objective: "Table of Elements Creation", num_months: 4)
  #     @exp4 = Experiment.create!(name: "Make Friends", objective: "Befriend Jane Goodall and Primates", num_months: 57)
      
  #     @marie.experiments << [@minerva, @exp2, @exp3, @exp4]
  #     @husband.experiments << [@minerva, @exp2, @exp4]
  #     @darwin.experiments << @exp4

  #     expect(@marie.num_experiments).to eq(4)    
  #     expect(@husband.num_experiments).to eq(3)    
  #     expect(@darwin.num_experiments).to eq(1)    
  #   end
  # end
end