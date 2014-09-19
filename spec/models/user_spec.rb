require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "has a to_param method that generates a correct_id" do
    user = build(:user)
    expect(user.correct_id?(user.to_param)).to be_truthy
  end
end
