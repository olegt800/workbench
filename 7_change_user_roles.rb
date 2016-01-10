require 'selenium-webdriver'
require 'test/unit'

class LoginTest < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
  end

  def test_change_user_role
    go_to_home_page

    #login phase
    wait = Selenium::WebDriver::Wait.new(:timeout => 2)
    wait.until { @browser.find_element(:class, 'login')}
    @browser.find_element(:class, 'login').click
    wait.until { @browser.find_element(:id, 'username')}
    @browser.find_element(:id, 'username').send_keys 'olegt800'
    @browser.find_element(:id, 'password').send_keys 'user4444'
    @browser.find_element(:name, 'login').click

    #Change user role phase
    @browser.find_element(:class, 'projects').click
    @browser.find_element(:id, 'q').send_keys('proj01', :return)
    sleep(1)
    @browser.find_element(:class, 'token-0').click
    @browser.find_element(:class, 'settings').click
    @browser.find_element(:id, 'tab-members').click
    sleep(1)
    @browser.find_element(:css,'tbody a.icon.icon-edit').click
    a = @browser.find_elements(:css,'tbody p label input')
    until a[1].attribute('checked') == "true"
      a[1].click
      end
    @browser.find_element(:css,'tbody p input.small').click
    sleep(1)
    @browser.find_element(:css,'tbody a.icon.icon-edit').click
    a = @browser.find_elements(:css,'tbody p label input')


    assert_equal("true", a[1].attribute('checked'))
  end
# Не смог разобраться как сработало это условие >> assert_equal("true", a[1].attribute('checked')) и почему оно запрашивает "true" как текст, а не булиевый? .
  def go_to_home_page
    @browser.get 'http://demo.redmine.org'
  end


  def teardown
    @browser.quit
  end


end


