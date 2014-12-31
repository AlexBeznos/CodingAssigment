module API
  module V1
    class TopicsController < ApplicationController

      def index
        @topics = Topic.all
      end

      def show
        @topic = Topic.find(params[:id])
      end
    end
  end
end
