module Api
  module V1
    module Communication
      class PrivateMessagesController < ApplicationController
        def show
          messages_count = ForumMessagesChecker.new(user_params).call
          render json: { unread_messages_count: messages_count }, status: :ok
        end

        private

        def user_params
          params.require(:username)
          params.require(:password)
        end
      end
    end
  end
end
