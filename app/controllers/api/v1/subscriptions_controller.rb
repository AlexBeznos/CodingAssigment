module API
  module V1
    class SubscriptionsController < ApplicationController
      def create
        @subscription = Subscription.new(sb_params)
        @subscription.subscribe
        @subscribe
      end

      def delete
        @subscription = Subscription.new(sb_params)
        @subscription.unsubscribe
        @subscribe
      end

      private
      def sb_params
        params.require(:subscription).permit(:user_id, :topic_id)
      end
    end
  end
end
