require 'rails_helper'

RSpec.describe 'Scientist Show Page', type: :feature do
  describe 'US1' do
    describe 'as a visitor when i visit scientist_path' do
      before(:each) do
        @lab = Lab.create!(name: "Fermilab")
        @marie = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")

        @minerva = @marie.experiments.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
        @exp2 = @marie.experiments.create!(name: "Nobel Prize Idea", objective: "Something super duper smart", num_months: 4)
        @exp3 = @marie.experiments.create!(name: "Accredidate Husband's name", objective: "Table of Elements Creation", num_months: 4)
        
        visit scientist_path(@marie)
      end
      it 'displays' do
        expect(page).to have_content(@marie.name)
        expect(page).to have_content(@marie.specialty)
        expect(page).to have_content(@marie.university)
        expect(page).to have_content(@marie.lab.name)

        expect(page).to have_content(@minerva.name)#refactor into div block if time
        expect(page).to have_content(@exp2.name)
        expect(page).to have_content(@exp3.name) 
        save_and_open_page
      end
    end 
  end
end