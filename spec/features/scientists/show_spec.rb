require "rails_helper"

RSpec.describe "Scientist Show Page", type: :feature do
  before :each do
    @experiments = FactoryBot.create_list(:experiment, 5)

    # Create 5 labs
    @labs = FactoryBot.create_list(:lab, 5)

    # Create 5 scientists associated with random labs
    @scientists = FactoryBot.create_list(:scientist, 5, lab: @labs.sample)

    # Create 5 scientist-experiment associations
    @scientist_experiments = FactoryBot.create_list(:scientist_experiment, 5, scientist: @scientists.sample, experiment: @experiments.sample)
  end
  @scientist1 = @scientists.first
      visit scientist(@scientist1.id)
  end

  describe "US 1" do
    it "displays all the scientist's information" do
      expect(page).to have_content(@scientist1.name, count: 1)
      expect(page).to have_content(@scientist1.specialty, count: 1)
      expect(page).to have_content(@scientist1.univeristy, count: 1)
      expect(page).to have_content(@scientist1.lab, count: 1)
    end
  end
end