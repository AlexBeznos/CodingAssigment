class Subscription
  attr_reader :user, :topic

  def initialize(params)
    @user = User.find(params[:user_id])
    @topic = Topic.find(params[:topic_id])
  end

  def subscribe
    unless @user.topics.include?(@topic)
      @user.topics << @topic
    end
  end

  def unsubscribe
    if @user.topics.include?(@topic)
      @user.topics.delete(@topic)
    end
  end
end
