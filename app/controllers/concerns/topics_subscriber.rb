module TopicsSubscriber
  extend ActiveSupport::Concern
  
  def subscribe_me
    unless @user.topics.include?(@topic)
      @user.topics << @topic
    end
  end

  def unsubscribe_me
    if @user.topics.include?(@topic)
      @user.topics.delete(@topic)
    end
  end
end