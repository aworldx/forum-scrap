require 'rails_helper'

RSpec.describe '/api/v1/communication/private_messages', type: :request do
  describe 'request without params' do
    it 'returns status code 400' do
      get '/api/v1/communication/private_messages'
      expect(response).to have_http_status(400)
      expect(json['error']).to include('param is missing or the value is empty')
    end
  end

  describe 'request with login and password' do
    before { private_message_request }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns unread messages count' do
      expect(json).not_to be_empty
      expect(json.keys).to contain_exactly("unread_messages_count")
    end
  end

  describe 'with wrong navigation finder' do
    it 'returns 504' do
      stub_const("ForumScraper::WELCOME_STR_FINDER", { xpath: "//b[contains(text(),'foo')]" })
      private_message_request
      expect(response).to have_http_status(504)
      expect(json['error']).to include('no such element')
    end
  end
end
