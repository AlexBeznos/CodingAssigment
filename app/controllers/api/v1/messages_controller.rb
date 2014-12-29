module API
  module V1
    class MessagesController < ApplicationController
      def create
        @message = Topic.find(params[:topic_id])
                        .messages.create(body: params[:message], user_id: params[:user_id])
      end
    end
  end
end