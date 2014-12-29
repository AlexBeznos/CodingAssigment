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

  context "notifications" do
    before do
      @user = FactoryGirl.create(:user)
      @user_2 = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)

      @topic.users << @user
      @topic.users << @user_2

      @body = "Hello world"
      @topic.messages.create(body: @body, user_id: @user.id)
    end

    it "should make message" do
      @topic.messages.last.body.should eq @body
      @topic.messages.last.user.should eq @user
    end

    it "should send notifications to users in topic but not to message owner" do
      Notification.last.users.should include(@user_2)
      Notification.last.users.should_not include(@user)
    end
  end
end
