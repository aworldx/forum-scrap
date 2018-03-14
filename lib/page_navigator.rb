# Wrapper for Selenium Web Driver.
# Provides simple queries to the web page
class PageNavigator
  # driver
  def initialize
    @options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
    @driver = Selenium::WebDriver.for(:chrome, options: @options)
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def self.finalize
    @driver.quit
  end

  def go_to(url)
    @driver.get(url)
  end

  def fill_input(finder, value)
    element = @driver.find_element(finder)
    element.send_keys(value)
  end

  def fill_form(params = [])
    params.each do |param|
      fill_input(param[:finder], param[:value])
    end
  end

  def click(finder)
    button = @driver.find_element(finder)
    button.click
  end

  def element_text(finder)
    element = @driver.find_element(finder)
    element.text
  end

  def wait_until_appears(finder)
    @wait.until { @driver.find_element(finder) }
  end
end
