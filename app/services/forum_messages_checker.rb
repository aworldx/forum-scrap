class ForumMessagesChecker
  def initialize(params)
    @username = params[:username]
    @password = params[:password]
  end

  def call
    scraper = ForumScraper.new
    scraper.login(@username, @password)
    scraper.unread_messages_count
  end
end
