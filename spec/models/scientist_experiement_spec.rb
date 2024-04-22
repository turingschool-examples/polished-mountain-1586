require 'rails_helper'

RSpec.describe ScientistExperiement do
  it {should belong_to(:scientist)}
  it {should belong_to(:experiment)}
end