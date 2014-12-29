require 'rails_helper'

RSpec.describe Notification, :type => :model do
  let(:notification) { FactoryGirl.create(:notification) }
  subject { notification }

  it "should have valid factory" do
    should be_valid
  end
end
