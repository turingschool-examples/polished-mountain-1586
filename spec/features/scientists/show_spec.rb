require "rails_helper"

RSpec.describe "Scientists show page" do
  before(:each) do
    @laboratory = Lab.create!(
      name: "Falconer Lab"
    )

    @scientist1 = Scientist.create!(
      name: "John Falconer",
      specialty: "Thermodynamics",
      university: "University of Colorado Boulder",
      lab: @laboratory
    )

    @scientist2 = Scientist.create!(
      name: "Neil Hendren",
      specialty: "Simulations",
      university: "University of Colorado Boulder",
      lab: @laboratory
    )

    @experiment1 = Experiment.create!(
      name: "Thin-Membrane Separations",
      objective: "Separate gasses into individual components using thin membranes",
      num_months: 36
    )

    @experiment2 = Experiment.create!(
      name: "Gas-Phase Reaction Characterization",
      objective: "Find a reaction mechanism for various gas-phase reactions",
      num_months: 50
    )

    ScientistExperiment.create!(
      scientist: @scientist1,
      experiment: @experiment1
    )

    ScientistExperiment.create!(
      scientist: @scientist1,
      experiment: @experiment2
    )

    ScientistExperiment.create!(
      scientist: @scientist2,
      experiment: @experiment1
    )

    visit "scientists/#{@scientist1.id}"
  end

  it "shows the scientist's information" do
    within ".page-header" do
      expect(page).to have_content("John Falconer")
    end

    within "#information" do
      expect(page).to have_content("Specialty: Thermodynamics")
      expect(page).to have_content("University: University of Colorado Boulder")
      expect(page).to have_content("This scientist works in the Falconer Lab")
    end
  end

  it "displays the experiments this scientist is working on" do
    within "#experiments" do
      expect(page).to have_content("Experiments this scientist is working on:")
      expect(page).to have_content("Thin-Membrane Separations")
      expect(page).to have_content("Gas-Phase Reaction Characterization")
    end
  end

  describe "#remove experiment" do
    it "has a button to remove an experiment from the scientist's work load" do
      within "#experiment-#{@experiment1.id}" do
        expect(page).to have_button("remove")
      end

      within "#experiment-#{@experiment2.id}" do
        expect(page).to have_button("remove")
      end
    end

    it "when I click the remove button it removes the experiment from the scientist" do
      within "#experiment-#{@experiment1.id}" do
        click_button("remove")
      end

      expect(page).to have_current_path("/scientists/#{@scientist1.id}")
      expect(page).to_not have_content("Thin-Membrane Separations")
    end

    it "does not affect the experiments listed on another scientist's show page" do
      within "#experiment-#{@experiment1.id}" do
        click_button("remove")
      end

      visit "scientists/#{@scientist2.id}"

      expect(page).to have_content("Thin-Membrane Separations")
    end
  end
end
