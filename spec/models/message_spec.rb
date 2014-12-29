require 'rails_helper'

RSpec.describe Message, :type => :model do
  let(:message) { FactoryGirl.create(:message) }
  
  it "should have valid factory" do
    message.should be_valid
  end

  context "test reletions" do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)

      @user.topics << @topic
      @user.topics.find(@topic.id).messages << message
    end

    it "should belongs to topic" do
      @topic.messages.should include(message)
    end

    it "should add messages for user" do
      @user.messages.should include(message)
    end
  end
end
