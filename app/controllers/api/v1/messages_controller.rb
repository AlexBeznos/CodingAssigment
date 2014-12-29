module API
  module V1
    class MessagesController < ApplicationController
      include MessageConcern
      after_action :send_notifications
      def post
        @user = User.find(params[:user_id])
        @message = @user.topics.find(params[:topic_id])
                        .messages.create(body: params[:message])
      end
    end
  end
end