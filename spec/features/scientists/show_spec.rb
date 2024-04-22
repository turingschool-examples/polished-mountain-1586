require "rails_helper"

RSpec.describe "Scientist Show Page", type: :feature do
  before :each do
    @experiment1 = Experiment.create!(name: "Experiment 1", objective: "Objective 1", num_months: 6)
    @experiment2 = Experiment.create!(name: "Experiment 2", objective: "Objective 2", num_months: 12)
    
    @lab1 = Lab.create!(name: "Lab 1")
    @lab2 = Lab.create!(name: "Lab 2")

    @scientist1 = Scientist.create!(name: "Scientist 1", specialty: "Specialty 1", university: "University 1", lab_id: @lab1.id)
    @scientist2 = Scientist.create!(name: "Scientist 2", specialty: "Specialty 2", university: "University 2", lab_id: @lab2.id)

    @scientist_experiment1 = ScientistExperiment.create!(scientist_id: @scientist1.id, experiment_id: @experiment1.id)
    @scientist_experiment1 = ScientistExperiment.create!(scientist_id: @scientist2.id, experiment_id: @experiment1.id)
    @scientist_experiment1 = ScientistExperiment.create!(scientist_id: @scientist2.id, experiment_id: @experiment2.id)

    visit scientist_path(@scientist1.id)
  end

  describe "US 1" do
    it "displays all the scientist's information" do
      expect(page).to have_content(@scientist1.name, count: 1)
      expect(page).to have_content(@scientist1.specialty, count: 1)
      expect(page).to have_content(@scientist1.university, count: 1)
      expect(page).to have_content(@lab1.name, count: 1)
      expect(page).to have_content(@experiment1.name, count: 1)
    end
  end

  describe "US 2" do
    it "see a button to remove an experiment from a scientist but not other scientists" do
      
      expect(page).to have_content(@experiment1.name, count: 1)
      expect(page).to have_button("Remove")

      click_button("Remove")

      expect(page).to_not have_content(@experiment1.name)

      visit scientist_path(@scientist2.id)

      expect(page).to have_content(@experiment1.name, count: 1)
    end
  end
  
  describe "US 3" do
    it "" do
      
    end
  end
end