module MessageConcern
  def send_notifications
    self.topic.users.each do |user|
      user.notifications << Notification.create(body: "User #{self.user.id} send message to Topic #{self.topic.id}")
    end
  end
end