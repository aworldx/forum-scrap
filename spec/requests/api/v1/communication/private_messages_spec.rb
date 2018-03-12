require 'rails_helper'

RSpec.describe '/api/v1/communication/private_messages', type: :request do
  describe 'request without params' do
    it 'returns status code 401' do
      get '/api/v1/communication/private_messages'
      expect(response).to have_http_status(401)
      expect(json['error']).to include('Parameter username is required')
    end
  end

  describe 'request with login and password' do 
    before { get '/api/v1/communication/private_messages?username=aworldx@gmail.com&password=ugjdD5eq' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns unread messages count' do
      expect(json).not_to be_empty
      expect(json.keys).to contain_exactly("unread_messages_count")
    end
  end

  describe 'with wrong navigation finder' do
    it 'returns 404' do
      stub_const("WELCOME_STR_FINDER", { xpath: "//b[contains(text(),'foo')]" })
      get '/api/v1/communication/private_messages?username=aworldx@gmail.com&password=ugjdD5eq'
      expect(response).to have_http_status(404)
      expect(json['error']).to include('no such element')
    end
  end
end