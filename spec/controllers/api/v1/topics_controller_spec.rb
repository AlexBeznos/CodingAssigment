require 'rails_helper'

RSpec.describe API::V1::TopicsController do
  describe "#subscribe" do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)

      post :subscribe, :id => @topic.id, :user => @user.id
    end

    it "should response with status 200" do
      response.status.should eq 200
    end

    it "should add topic to user's topics" do
      @user.topics.should include(@topic)
    end
  end

  describe "#unsubscribe" do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)

      @user.topics << @topic
      post :unsubscribe, :id => @topic.id, :user => @user.id
    end

    it "should response with status 200" do
      response.status.should eq 200
    end

    it "should add topic to user's topics" do
      @topic.users.should_not include(@user)
    end
  end
end
