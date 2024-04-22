require 'rails_helper'

RSpec.describe 'Experiment Index page', type: :feature do
  describe 'US3' do
    describe 'As a visitor when I visit experiments_path' do
      before(:each) do
        @lab = Lab.create!(name: "Fermilab")

        @marie = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
        @darwin = @lab.scientists.create!(name: "Chuck Darwin", specialty: "Bird Beaks", university: "Galapagos Islands")

        @minerva = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
        @exp2 = Experiment.create!(name: "Nobel Prize Idea", objective: "Something super duper smart", num_months: 4)
        @exp3 = Experiment.create!(name: "Accredidate Husband's name", objective: "Table of Elements Creation", num_months: 7)
        @exp4 = Experiment.create!(name: "Make Friends", objective: "Befriend Jane Goodall and Primates", num_months: 57)
        
        @marie.experiments << [@minerva, @exp2, @exp3, @exp4]
        @darwin.experiments << @exp4

        visit experiments_path
      end
      it 'displays the names of all experiments longer than 6 months longest to shortest' do
        expect(@exp4.name).to appear_before(@exp3.name)
      end
    end 
  end
end