# Wrapper for Selenium Web Driver.
# Provides simple queries to the web page
class PageNavigator
  # Selenium web-driver configuration.
  # ChromeDriver must be installed before
  def initialize
    @options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    @driver = Selenium::WebDriver.for(:chrome, options: @options)
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def self.finalize
    @driver.quit
  end

  # Redeirects browser to the specific page
  #
  # * +url+ - string, page adress
  def go_to(url)
    @driver.get(url)
  end

  # Finds and fills input control
  #
  # * +finder+ - hash, where :key presents search method
  #              and :value presents search value
  # * +value+ - string for input value
  def fill_input(finder, value)
    element = @driver.find_element(finder)
    element.send_keys(value)
  end

  # Fills multiple inputs
  #
  # * +params+ - array, each element is input finder
  #              and value to fill
  def fill_form(params = [])
    params.each do |param|
      fill_input(param[:finder], param[:value])
    end
  end

  # Clicks button
  #
  # * +finder+ - hash
  def click(finder)
    button = @driver.find_element(finder)
    button.click
  end

  # Retrieves text from a page element
  #
  # * +finder+ - hash
  def element_text(finder)
    element = @driver.find_element(finder)
    element.text
  end

  # Searches for an item with a wait.
  # Usually used, when redirecting to the page,
  # where the searched element is located.
  #
  # * +finder+ - hash
  def wait_until_appears(finder)
    @wait.until { @driver.find_element(finder) }
  end
end
