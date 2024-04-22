require 'rails_helper'

RSpec.describe Lab, type: :model do
  it {should have_many :scientists}
end