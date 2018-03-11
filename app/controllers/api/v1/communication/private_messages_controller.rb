module Api
  module V1
    module Communication
      class PrivateMessagesController < ApplicationController
        before_action :validate_params

        def validate_params
          param! :username, String, required: true
          param! :password, String, required: true
        end

        def show
          checker = ForumMessagesChecker.new(params)
          messages_count = checker.call
          render json: { unread_messages_count: messages_count }, status: :ok
        end
      end
    end
  end
end
