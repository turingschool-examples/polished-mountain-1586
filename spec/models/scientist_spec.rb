require 'rails_helper'

RSpec.describe Scientist do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:specialty) }
    it { should validate_presence_of(:university) }
  end
  describe "relationships" do
    it {should belong_to :lab}
    it { should have_many :experiment_scientists }
    it { should have_many(:experiments).through(:experiment_scientists) }
  end 
end