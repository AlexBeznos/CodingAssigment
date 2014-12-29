class Message < ActiveRecord::Base
  include MessageConcern
  after_commit :send_notifications, on: :create
  belongs_to :topic
  belongs_to :user
end
