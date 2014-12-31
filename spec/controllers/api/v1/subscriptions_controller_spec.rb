require 'rails_helper'

RSpec.describe API::V1::SubscriptionsController do
  describe "#subscribe" do
    before do
      @user = FactoryGirl.create(:user)
      @topic = FactoryGirl.create(:topic)

      post :create, :subscription => { :topic_id => @topic.id, :user_id => @user.id }
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
      post :delete, :subscription => { :topic_id => @topic.id, :user_id => @user.id }
    end

    it "should response with status 200" do
      response.status.should eq 200
    end

    it "should add topic to user's topics" do
      @topic.users.should_not include(@user)
    end
  end
end
