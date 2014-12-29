require 'rails_helper'

RSpec.describe Message, :type => :model do
  let(:message) { FactoryGirl.create(:message) }
  
  it "should have valid factory" do
    message.should be_valid
  end

  context "test reletions" do
    before do
      @user = FactoryGirl.build(:user)
      @topic = FactoryGirl.build(:topic)

      @topic.messages << message
    end

    it "should belongs to topic" do
      @topic.messages.should include(message)
    end
  end
end
