require 'rails_helper'

RSpec.describe 'scientist#show', type: :feature do
  before(:each) do
    @lab = Lab.create!(name: "Tampa Lab")
    @scientist = Scientist.create!(
      name: "Luis",
      specialty: "Numbers",
      university: "Harvard",
      lab_id: @lab.id
    )
    @experiment1 = Experiment.create!(
      name: "Fire",
      objective: "Test for fire",
      num_months: 4
    )
    @experiment2 = Experiment.create!(
      name: "Polution",
      objective: "Test for polution",
      num_months: 6
    )
    @experiment3 = Experiment.create!(
      name: "Hello",
      objective: "Test for Luis",
      num_months: 6
    )

    @experiment_scientists_1 = ExperimentScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist.id)
    @experiment_scientists_2 = ExperimentScientist.create!(experiment_id: @experiment2.id, scientist_id: @scientist.id)
  end

  # User Story 1, Scientist Show Page
  it "displays a scientist with his respective lab and their experiments" do
    # As a visitor
    # When I visit a scientist's show page
    visit scientist_path(@scientist)
    # I see all of that scientist's information including:
    within '.scientist_attributes_and_lab' do
      within "#scientist-#{@scientist.id}" do
        # - name
        expect(page).to have_content(@scientist.name)
        # - specialty
        expect(page).to have_content(@scientist.specialty)
        # - university where they got their degree
        expect(page).to have_content(@scientist.university)
        # And I see the name of the lab where this scientist works
        expect(page).to have_content(@lab.name)
      end
    end
    # And I see the names of all of the experiments this scientist is running
    expect(page).to have_content(@experiment1.name)
    expect(page).to have_content(@experiment2.name)
    expect(page).to_not have_content(@experiment3.name)
  end
end