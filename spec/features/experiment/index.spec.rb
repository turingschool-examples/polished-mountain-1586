require "rails_helper"

RSpec.describe "Experiments Index Page" do
  before(:each) do
    @lab1 = Lab.create!(name: "Fusion Lab")
    @lab2 = Lab.create!(name: "Fission Lab")
    @scientist1 = @lab1.scientists.create!(name: "Dr. Atom", specialty: "Atoms", university: "Atom University")
    @scientist2 = @lab1.scientists.create!(name: "Dr. Neutron", specialty: "Neutrons", university: "Neutron University")
    @experiment1 = Experiment.create!(name: "Splitting the Atom", objective: "Split the atom", num_months: 12)
    @experiment2 = Experiment.create!(name: "Putting the Atom Back Together", objective: "Put the atom back together", num_months: 24)
    @experiment3 = Experiment.create!(name: "Super Glue", objective: "Make the world's strongest glue", num_months: 7)
    @experiment4 = Experiment.create!(name: "Super Duper Glue", objective: "Make the world's even stronger strongest glue", num_months: 3)
    @experiment1.scientists << @scientist1
    @experiment1.scientists << @scientist2
    @experiment2.scientists << @scientist1

    visit experiments_path
  end

  describe "User Story 3" do
    it "displays the names of all long-running experiments in descending order (longest to shortest)" do
      expect(page).to have_content ("Splitting the Atom")
      expect(page).to have_content ("Putting the Atom Back Together")
      expect(page).to have_content ("Super Glue")
      expect(page).to_not have_content ("Super Duper Glue")

      expect("Putting the Atom Back Together").to appear_before("Splitting the Atom")
      expect("Splitting the Atom").to appear_before("Super Glue")
    end
  end
end