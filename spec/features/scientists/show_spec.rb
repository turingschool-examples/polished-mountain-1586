require "rails_helper"

RSpec.describe "Scientist show page" do
  before(:each) do
    @lab1 = Lab.create!(name: "Lab1")

    @sc1 = @lab1.scientists.create!(name: "Martin", specialty: "Surgery", university: "Turing", experiment_id: @ep1)
    @sc2 = @lab1.scientists.create!(name: "Rodrigo", specialty: "Radioactivity", university: "Monsters inc", experiment_id: @ep1)

    @ep1 = Experiment.create!(name: "MINERvA", objective: "Minerals", num_months: 4, scientist_id: @sc1.id)
    @ep2 = Experiment.create!(name: "Ep2", objective: "Brain", num_months: 6, scientist_id: @sc1.id)

  end

  describe '#us 1' do
    it 'displays scientist attributes' do
      # When I visit a scientist's show page
      visit scientist_path(@sc1)
      # I see all of that scientist's information including:
      #  - name
      expect(page).to have_content("Name: Martin")
      #  - specialty
      expect(page).to have_content("Specialty: Surgery")
      #  - university where they got their degree
      expect(page).to have_content("University: Turing")
      # And I see the name of the lab where this scientist works
      expect(page).to have_content("Lab: Lab1")
      p
      # And I see the names of all of the experiments this scientist is running
      save_and_open_page
      expect(page).to have_content("Experiment: MINERvA")
      expect(page).to have_content("Experiment: Ep2")

    end
  end
end