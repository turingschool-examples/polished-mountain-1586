require 'rails_helper'

RSpec.describe 'scientist#show', type: :feature do
  before(:each) do
    @lab = Lab.create!(name: "Tampa Lab")

    @scientist_1 = Scientist.create!(
      name: "Luis",
      specialty: "Numbers",
      university: "Harvard",
      lab_id: @lab.id
    )

    @scientist_2 = Scientist.create!(
      name: "Walter",
      specialty: "Persons",
      university: "Tampa University",
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

    @experiment_scientists_1 = ExperimentScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist_1.id)
    @experiment_scientists_2 = ExperimentScientist.create!(experiment_id: @experiment2.id, scientist_id: @scientist_1.id)
    @experiment_scientists_3 = ExperimentScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist_2.id)

  end

  # User Story 1, Scientist Show Page
  it "displays a scientist with his respective lab and their experiments" do
    # As a visitor
    # When I visit a scientist's show page
    visit scientist_path(@scientist_1)
    # I see all of that scientist's information including:
    within '.scientist_attributes_and_lab' do
      within "#scientist-#{@scientist_1.id}" do
        # - name
        expect(page).to have_content(@scientist_1.name)
        # - specialty
        expect(page).to have_content(@scientist_1.specialty)
        # - university where they got their degree
        expect(page).to have_content(@scientist_1.university)
        # And I see the name of the lab where this scientist works
        expect(page).to have_content(@lab.name)
        # And I see the names of all of the experiments this scientist is running
        expect(page).to have_content(@experiment1.name)
        expect(page).to have_content(@experiment2.name)
        expect(page).to_not have_content(@experiment3.name)
      end
    end
  end

  # User Story 2, Remove an Experiment from a Scientist
  it "can delete a experiment from a scientist" do
    # As a visitor
    # When I visit a scientist's show page
    visit scientist_path(@scientist_1)

    expect(page).to have_content(@experiment1.name)
    within "#scientist-#{@scientist_1.id}" do
      # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
      expect(page).to have_content("Remove Experiment")
      # When I click that button for one experiment
      click_button("Remove Experiment", match: :first)
      # I'm brought back to the scientist's show page
      expect(current_path).to eq(scientist_path(@scientist_1))
      # And I no longer see that experiment's name listed
      expect(page).to_not have_content(@experiment1.name)
    end

    visit scientist_path(@scientist_2)
    within "#scientist-#{@scientist_2.id}" do
    # And when I visit a different scientist's show page that is working on that same experiment,
    # Then I see that the experiment is still on the other scientist's work load
      expect(page).to have_content(@experiment1.name)
    end
  end
end