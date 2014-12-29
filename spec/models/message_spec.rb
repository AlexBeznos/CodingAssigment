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

    it "should send notifications" do
      @topic.users.each do |user|
        user.notifications.last.body.should eq "User #{@user.id} send message to Topic #{@topic.id}"
      end
    end
  end
end
