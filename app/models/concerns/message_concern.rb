module MessageConcern
  def send_notifications
    i = 0
    self.topic.users.each do |user|
        notification = Notification.create(body: "User #{self.user.id} send message to Topic #{self.topic.id}")
        user.notifications << notification
    end
  end
end