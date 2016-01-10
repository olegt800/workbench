require 'selenium-webdriver'
require 'test/unit'

class LoginTest < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
  end

  def test_positive_login
    go_to_home_page

    @browser.find_element(:class, 'login').click
    @browser.find_element(:id, 'username').send_keys 'olegt800'
    @browser.find_element(:id, 'password').send_keys 'user4444'
    @browser.find_element(:name, 'login').click


    assert_equal(true, @browser.find_element(:id, 'loggedas').displayed?)
  end

  def go_to_home_page
    @browser.get 'http://demo.redmine.org'
  end


  def teardown
    @browser.quit
  end


end


