module API
  module V1
    class TopicsController < ApplicationController
      include TopicsSubscriber

      def index
        @topics = Topic.all
      end

      def show
        @topic = Topic.find(params[:id])
      end

      def subscribe
        @topic = Topic.find(params[:id])
        @user = User.find(params[:user])
        subscribe_me
      end

      def unsubscribe
        @topic = Topic.find(params[:id])
        @user = User.find(params[:user])
        unsubscribe_me
      end
    end
  end
end