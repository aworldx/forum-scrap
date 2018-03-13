class ForumScraper
  FORUM_URL = "http://www.cyberforum.ru/"
  LOGIN_URL = "http://www.cyberforum.ru/log-in.php"
  LOGIN_FINDER = { name: 'vb_login_username' }
  PASSWORD_FINDER = { name: 'vb_login_password' }
  LOGIN_BUTTON_FINDER = { xpath: "//input[@type='submit' and @value='Вход']" }
  WELCOME_STR_FINDER = { xpath: "//b[contains(text(),'Добро пожаловать')]" }
  UNREAD_MESSAGES_FINDER = { xpath: "//span[@id='notifications']/b" }
  DEFAULT_WAIT_TIME = 10

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
