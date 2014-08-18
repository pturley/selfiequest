require 'rails_helper'

RSpec.describe Selfie, :type => :model do
  it "has a valid factory" do
    expect(build(:selfie)).to be_valid
  end
end
