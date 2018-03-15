module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def private_message_request
    get '/api/v1/communication/private_messages?'\
      "username=#{ENV['TEST_LOGIN']}&password=#{ENV['TEST_PASSWORD']}"
  end
end
