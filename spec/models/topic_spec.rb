require 'rails_helper'

RSpec.describe Topic, :type => :model do
  let(:topic) { FactoryGirl.create(:topic) }

  it "should have a valid factory" do
    topic.should be_valid
  end

  context "test reletions" do
    before do
      @user = FactoryGirl.build(:user)
      @user_2 = FactoryGirl.build(:user)
      @message = FactoryGirl.build(:message)
      topic.users << @user
      topic.users << @user_2
      topic.messages << @message
    end

    it "should have many users" do
      topic.users.should include(@user)
      topic.users.should include(@user_2)
    end  

    it "should belongs to user" do
      @user.topics.should include(topic)
    end  

    it "should have many messages" do
      topic.messages.should include(@message)
    end
  end
end
