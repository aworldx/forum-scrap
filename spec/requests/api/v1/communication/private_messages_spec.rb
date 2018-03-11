require 'rails_helper'

RSpec.describe '/api/v1/communication/private_messages', type: :request do
  describe 'GET' do 
    before { get '/api/v1/communication/private_messages' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns unread messages count' do
      expect(json).not_to be_empty
      expect(json.keys).to contain_exactly("unread_messages_count")
    end
  end
end
