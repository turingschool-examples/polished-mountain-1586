require "rails_helper"

RSpec.describe "Lab Show Page" do
  before(:each) do
    @lab1 = Lab.create!(name: "Fusion Lab")
    @lab2 = Lab.create!(name: "Fission Lab")
    @scientist1 = @lab1.scientists.create!(name: "Dr. Atom", specialty: "Atoms", university: "Atom University")
    @scientist2 = @lab1.scientists.create!(name: "Dr. Neutron", specialty: "Neutrons", university: "Neutron University")
    @scientist3 = @lab1.scientists.create!(name: "Dr. Neutrino", specialty: "Neutrinos", university: "Neutrino University")
    @scientist4 = @lab2.scientists.create!(name: "Dr. No", specialty: "Nil Values", university: "Nil University")
    @experiment1 = Experiment.create!(name: "Splitting the Atom", objective: "Split the atom", num_months: 12)
    @experiment2 = Experiment.create!(name: "Putting the Atom Back Together", objective: "Put the atom back together", num_months: 24)
    @experiment3 = Experiment.create!(name: "What is Life?", objective: "Discover the meaning of life", num_months: 100)
    @experiment1.scientists << @scientist1
    @experiment1.scientists << @scientist2
    @experiment1.scientists << @scientist3
    @experiment2.scientists << @scientist1
    @experiment2.scientists << @scientist3
    @experiment3.scientists << @scientist1

    visit lab_path(@lab1)
  end

  describe "Extension" do
    it "displays the lab's name and the names of all scientists that work at this lab" do
      save_and_open_page
      expect(page).to have_content("Fusion Lab")
      expect(page).to have_content("Dr. Atom")
      expect(page).to have_content("Dr. Neutron")
      expect(page).to have_content("Dr. Neutrino")
      expect(page).to_not have_content("Dr. No")
    end

    it "next to each scientist, it displays the number of experiments associated with this scientist" do
      within "#scientist-#{@scientist1.id}" do
        expect(page).to have_content("Experiment Count: 3")
      end

      within "#scientist-#{@scientist2.id}" do
        expect(page).to have_content("Experiment Count: 1")
      end

      within "#scientist-#{@scientist3.id}" do
        expect(page).to have_content("Experiment Count: 2")
      end
    end

    it "displays the scientists ordered from most to least number of experiments" do
      expect(@scientist1.name).to appear_before(@scientist3.name)
      expect(@scientist3.name).to appear_before(@scientist2.name)
    end
  end
end