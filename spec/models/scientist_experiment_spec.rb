require 'rails_helper'

RSpec.describe ScientistExperiment do
  it {should belong_to :scientist}
  it {should belong_to :experiment}
end