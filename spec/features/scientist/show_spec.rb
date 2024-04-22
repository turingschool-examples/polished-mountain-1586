require "rails_helper"

RSpec.describe "Scientist Show Page" do
  before(:each) do
    @lab1 = Lab.create!(name: "Fusion Lab")
    @lab2 = Lab.create!(name: "Fission Lab")
    @scientist1 = @lab1.scientists.create!(name: "Dr. Atom", specialty: "Atoms", university: "Atom University")
    @scientist2 = @lab1.scientists.create!(name: "Dr. Neutron", specialty: "Neutrons", university: "Neutron University")
    @experiment1 = @scientist1.experiments.create!(name: "Splitting the Atom", objective: "Split the atom", num_months: 12)
    @experiment2 = @scientist1.experiments.create!(name: "Putting the Atom Back Together", objective: "Put the atom back together", num_months: 24)

    visit scientist_path(@scientist1)
  end

  describe "User Story 1" do
    it "displays all of the scientists information (name, specialty, university)" do
      within "#scientist-information" do
        expect(page).to have_content("Name: Dr. Atom")
        expect(page).to have_content("Specialty: Atoms")
        expect(page).to have_content("University: Atom University")
        expect(page).to_not have_content("Name: Dr. Neutron")
      end
    end

    it "displays the name of the lab where this scientist works" do
      within "#lab" do
        expect(page).to have_content("Fusion Lab")
        expect(page).to_not have_content("Fission Lab")
      end
    end

    it "displays the names of all experiments this scientist is running" do
      within "#experiments" do
        expect(page).to have_content("Experiments:")

        within "#experiment-#{@experiment1.id}" do
          expect(page).to have_content("Splitting the Atom")
          expect(page).to have_content("Objective: Split the atom")
          expect(page).to have_content("Length of Project: 12 months")
        end

        within "#experiment-#{@experiment2.id}" do
          expect(page).to have_content("Putting the Atom Back Together")
          expect(page).to have_content("Objective: Put the atom back together")
          expect(page).to have_content("Length of Project: 24 months")
        end
      end
    end
  end
end