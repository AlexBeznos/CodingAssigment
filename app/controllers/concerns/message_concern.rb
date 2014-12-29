module MessageConcern
  extend ActiveSupport::Concern

  def send_notifications
    @message.topic.users.each do |user|
      user.notifications.create(body: "User #{@user.id} send message to Topic #{@message.topic.id}") unless user.id == @user.id 
    end
  end
end