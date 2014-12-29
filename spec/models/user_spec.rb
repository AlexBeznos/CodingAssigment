require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create(:user) }

  it "should have a valid factory" do
    user.should be_valid
  end
  
  context "Test reletions" do
    before do
      @topic = FactoryGirl.build(:topic)
      @topic_2 = FactoryGirl.build(:topic)
      user.topics << @topic
      user.topics << @topic_2
    end

    it "should have many topics" do
      user.topics.should include(@topic)
      user.topics.should include(@topic_2)
    end

    it "should belongs to topic" do
      @topic.users.should include(user)
    end
  end
end
