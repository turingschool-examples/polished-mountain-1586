require 'rails_helper'

RSpec.describe "Scientist Show Page" do
  before(:each) do
    @lab1 = Lab.create!(name: "Fermilab")
    @scientist1 = Scientist.create!(name: "hi", specialty: "teeth", university: "University of Paris", lab_id: @lab1.id)
    @scientist2 = Scientist.create!(name: "ho", specialty: "hee", university: "University of Italy", lab_id: @lab1.id)
    @experiment1 = @scientist1.experiments.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @experiment2 = @scientist1.experiments.create!(name: "vA", objective: "study food nuclei", num_months: 7)
    @scientist2.experiments << [@experiment1]
  end

  describe 'User Story 1' do
    it "displays scientist attributes" do
      visit scientist_path(@scientist1)

      expect(page).to have_content(@scientist1.name)
      expect(page).to have_content(@scientist1.specialty)
      expect(page).to have_content(@scientist1.university)
    end

    it "displays scientist lab" do
      visit scientist_path(@scientist1)

      expect(page).to have_content(@lab1.name)
    end

    it "displays scientist experiments" do
      visit scientist_path(@scientist1)

      expect(page).to have_content(@experiment1.name)
      expect(page).to have_content(@experiment2.name)
    end
  end

  describe 'User Story 2' do
    it "has a button to remove experiment" do
      visit scientist_path(@scientist1)

      expect(page).to have_button("Remove #{@experiment1.name}")
      click_on "Remove #{@experiment1.name}"
      expect(current_path).to eq(scientist_path(@scientist1))

      expect(page).to_not have_content(@experiment1.name)

      visit scientist_path(@scientist2)
      expect(page).to have_content(@experiment1.name)
    end
  end
end