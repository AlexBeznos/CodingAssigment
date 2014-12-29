require 'rails_helper'

RSpec.describe Topic, :type => :model do
  let(:topic) { FactoryGirl.create(:topic) }

  it "should have a valid factory" do
    topic.should be_valid
  end
end
