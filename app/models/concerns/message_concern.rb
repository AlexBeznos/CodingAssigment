module MessageConcern
  def send_notifications
    notification = Notification.create(body: "User #{self.user.id} send message to Topic #{self.topic.id}")
    self.topic.users.each do |user|
      unless user.id == self.user.id
        user.notifications << notification
      end
    end
  end
end