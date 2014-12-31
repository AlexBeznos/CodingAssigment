class Notifier
  def initialize(message)
    @message = message
  end

  def create
    @notification = Notification.new(body: "User #{@message.user.id} send message to Topic #{@message.topic.id}")

    if @notification.save
      send
    end
  end

  private
  def send
    @message.topic.users.each do |user|
      unless user.id == @message.user.id
        user.notifications << @notification
      end
    end
  end
end
