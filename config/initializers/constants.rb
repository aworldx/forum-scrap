FORUM_URL = "http://www.cyberforum.ru/"

# LOG IN

LOGIN_URL = "http://www.cyberforum.ru/log-in.php"
LOGIN_FINDER = { name: 'vb_login_username' }
PASSWORD_FINDER = { name: 'vb_login_password' }
LOGIN_BUTTON_FINDER = { xpath: "//input[@type='submit' and @value='Вход']" }
WELCOME_STR_FINDER = { xpath: "//b[contains(text(),'Добро пожаловать')]" }

# COMMUNICATION
UNREAD_MESSAGES_FINDER = { xpath: "//span[@id='notifications']/b" }

# OTHER

DEFAULT_WAIT_TIME = 10
