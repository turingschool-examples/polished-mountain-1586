require 'rails_helper'

RSpec.describe 'Scientist Show Page', type: :feature do
  describe 'US1' do
    describe 'as a visitor when i visit scientist_path' do
      before(:each) do
        @lab = Lab.create!(name: "Fermilab")

        @marie = @lab.scientists.create!(name: "Marie Curie", specialty: "Radioactivity", university: "University of Paris")
        @darwin = @lab.scientists.create!(name: "Chuck Darwin", specialty: "Bird Beaks", university: "Galapagos Islands")

        @minerva = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
        @exp2 = Experiment.create!(name: "Nobel Prize Idea", objective: "Something super duper smart", num_months: 4)
        @exp3 = Experiment.create!(name: "Accredidate Husband's name", objective: "Table of Elements Creation", num_months: 4)
        @exp4 = Experiment.create!(name: "Make Friends", objective: "Befriend Jane Goodall and Primates", num_months: 57)
        
        @marie.experiments << [@minerva, @exp2, @exp3, @exp4]
        @darwin.experiments << @exp4

        visit scientist_path(@marie)
      end
      it 'displays scientist attributes, lab name and experiments' do
        expect(page).to have_content(@marie.name)
        expect(page).to have_content(@marie.specialty)
        expect(page).to have_content(@marie.university)
        expect(page).to have_content(@marie.lab.name)

        within "#experiment-#{@minerva.id}" do
          expect(page).to have_content(@minerva.name)
        end

        within "#experiment-#{@exp2.id}" do
          expect(page).to have_content(@exp2.name)
        end

        within "#experiment-#{@exp3.id}" do
          expect(page).to have_content(@exp3.name)
        end

        within "#experiment-#{@exp4.id}" do
          expect(page).to have_content(@exp4.name)
        end
      end

      it "has button to remove experiment" do
        expect(page).to have_content(@exp4.name)

        within "#experiment-#{@exp4.id}" do
          expect(page).to have_button("Remove #{@exp4.name}")
        end

        click_button "Remove #{@exp4.name}"

        # I'm brought back to the scientist's show page
        expect(current_path).to eq(scientist_path(@marie))

        # And I no longer see that experiment's name listed
        expect(page).not_to have_content(@exp4.name)

        # And when I visit a different scientist's show page that is working on that same experiment,
        visit scientist_path(@darwin)
        expect(page).to have_content(@exp4.name)
        # Then I see that the experiment is still on the other scientist's work load

      end
    end 
  end
end