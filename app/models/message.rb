class Message < ActiveRecord::Base
  include MessageConcern
  after_create :send_notifications
  belongs_to :topic
  belongs_to :user
end
