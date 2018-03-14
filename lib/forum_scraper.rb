# Controls browser page navigation, searchs page elements, fills forms
class ForumScraper
  FORUM_URL = "http://www.cyberforum.ru/"
  LOGIN_URL = "http://www.cyberforum.ru/log-in.php"

  # Page navigator uses finder hashs for searching page controls.
  # Each finder is described by search method (by html tags, by attributes,
  # by xpath or other) and search value
  LOGIN_FINDER = { name: 'vb_login_username' }
  PASSWORD_FINDER = { name: 'vb_login_password' }
  LOGIN_BUTTON_FINDER = { xpath: "//input[@type='submit' and @value='Вход']" }
  WELCOME_STR_FINDER = { xpath: "//b[contains(text(),'Добро пожаловать')]" }
  UNREAD_MESSAGES_FINDER = { xpath: "//span[@id='notifications']/b" }

  # Time in seconds during which @navigator will wait
  # page control appearance
  DEFAULT_WAIT_TIME = 10

  # @navigator provides requests to the browser
  def initialize
    @navigator = PageNavigator.new
  end

  # Authenticates to the forum
  #
  # * +username+ - string
  # * +password+ - string
  def login(username, password)
    @navigator.go_to(LOGIN_URL)

    form_values = []
    form_values << { finder: LOGIN_FINDER, value: username }
    form_values << { finder: PASSWORD_FINDER, value: password }

    @navigator.fill_form(form_values)
    @navigator.click(LOGIN_BUTTON_FINDER)

    @navigator.wait_until_appears(WELCOME_STR_FINDER)
  end

  # Returns private messages count (string)
  # of authenticated user.
  def unread_messages_count
    @navigator.element_text(UNREAD_MESSAGES_FINDER)
  end
end
