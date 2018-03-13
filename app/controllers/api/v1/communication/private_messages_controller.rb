module Api
  module V1
    module Communication
      class PrivateMessagesController < ApplicationController
        before_action :params_validate 

        def show
          messages_count = ForumMessagesChecker.new(params).call
          render json: { unread_messages_count: messages_count }, status: :ok
        end

        private

        def params_validate
          required_params = ["username", "password"]
          missing_params = required_params - params.keys
          
          unless missing_params.empty?
            raise ActionController::ParameterMissing.new(missing_params)
          end
        end
      end
    end
  end
end
