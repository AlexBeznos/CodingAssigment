module API
  module V1
    class MessagesController < ApplicationController
      def create
        @message = Message.new(msg_params)

        if @message.save
          Notifier.new(@message).create
        end
      end

      private
      def msg_params
        params.require(:message).permit(:body, :user_id, :topic_id)
      end
    end
  end
end
