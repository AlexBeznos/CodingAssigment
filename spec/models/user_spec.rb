require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create(:user) }

  it "should have a valid factory" do
    user.should be_valid
  end
end
