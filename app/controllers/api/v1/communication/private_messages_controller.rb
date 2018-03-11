module Api
  module V1
    module Communication
      class PrivateMessagesController < ApplicationController
        def show
          checker = ForumMessagesChecker.new(method_params)
          messages_count = checker.call
          render json: { unread_messages_count: messages_count }, status: :ok
        end

        private

        def method_params
          params.require(:username).require(:password)
        end
      end
    end
  end
end
