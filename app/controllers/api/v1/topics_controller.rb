module API
  module V1
    class TopicsController < ApplicationController
      def index
        @topics = Topic.all
      end

      def show
        @topic = Topic.find(params[:id])
      end

      def subscribe
        @topic = Topic.find(params[:id])
        @user = User.find(params[:user])

        unless @user.topics.include?(@topic)
          @user.topics << @topic
        end
      end

      def unsubscribe
        @topic = Topic.find(params[:id])
        @user = User.find(params[:user])

        if @user.topics.include?(@topic)
          @user.topics.delete(@topic)
        end
      end
    end
  end
end