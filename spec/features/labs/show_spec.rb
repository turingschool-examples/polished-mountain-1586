require 'rails_helper'

RSpec.describe 'Lab Show Page', type: :feature do
  describe 'Extension' do
    describe 'As a visitor, when I visit lab_path' do
      before(:each) do
        @lab = Lab.create!(name: "Fermilab")

        @marie = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
        @husband = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
        @darwin = @lab.scientists.create!(name: "Chuck Darwin", specialty: "Bird Beaks", university: "Galapagos Islands")

        @minerva = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
        @exp2 = Experiment.create!(name: "Nobel Prize Idea", objective: "Something super duper smart", num_months: 4)
        @exp3 = Experiment.create!(name: "Accredidate Husband's name", objective: "Table of Elements Creation", num_months: 4)
        @exp4 = Experiment.create!(name: "Make Friends", objective: "Befriend Jane Goodall and Primates", num_months: 57)
        
        @marie.experiments << [@minerva, @exp2, @exp3, @exp4]
        @husband.experiments << [@minerva, @exp2, @exp4]
        @darwin.experiments << @exp4

        visit lab_path(@lab)
      end

      it 'displays the lab info and orders scientists based on their number of experiments ' do
        expect(page).to have_content(@lab.name)

        expect("#{@marie.name}, number of experiments: 4").to appear_before("#{@husband.name}, number of experiments: 3")

        expect("#{@husband.name}, number of experiments: 3").to have_content("#{@darwin.name}, number of experiments: 1")
      end
    end 
  end
end