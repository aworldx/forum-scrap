class ForumScraper
  def initialize
    @navigator = PageNavigator.new
  end 

  def login(username, password)
    @navigator.go_to(LOGIN_URL)
    
    form_values = []
    form_values << { finder: LOGIN_FINDER, value: username }
    form_values << { finder: PASSWORD_FINDER, value: password }

    @navigator.fill_form(form_values)
    @navigator.click(LOGIN_BUTTON_FINDER)

    @navigator.wait_until_appears(WELCOME_STR_FINDER)
  end

  def unread_messages_count
    @navigator.element_text(UNREAD_MESSAGES_FINDER)
  end
end
