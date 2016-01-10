require 'selenium-webdriver'
require 'test/unit'

class LoginTest < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
  end

  def test_positive_register
    go_to_home_page

    login = 'olegt800'
    @browser.find_element(:class, 'register').click
    @browser.find_element(:id, 'user_login').send_keys login
    @browser.find_element(:id, 'user_password').send_keys 'user4444'
    @browser.find_element(:id, 'user_password_confirmation').send_keys 'user4444'
    @browser.find_element(:id, 'user_firstname').send_keys 'oleg'
    @browser.find_element(:id, 'user_lastname').send_keys 'trubenko'
    @browser.find_element(:id, 'user_mail').send_keys login + '@gmail.com'

    @browser.find_element(:name, 'commit').click


    assert_equal(true, @browser.find_element(:id, 'flash_notice').displayed?)
  end

  def test_positive_register_2
    go_to_home_page

    login = 'test_user'
    @browser.find_element(:class, 'register').click
    @browser.find_element(:id, 'user_login').send_keys login
    @browser.find_element(:id, 'user_password').send_keys 'user4444'
    @browser.find_element(:id, 'user_password_confirmation').send_keys 'user4444'
    @browser.find_element(:id, 'user_firstname').send_keys 'oleg'
    @browser.find_element(:id, 'user_lastname').send_keys 'trubenko'
    @browser.find_element(:id, 'user_mail').send_keys login + '@gmail.com'

    @browser.find_element(:name, 'commit').click


    assert_equal(true, @browser.find_element(:id, 'flash_notice').displayed?)
  end

  def go_to_home_page
    @browser.get 'http://demo.redmine.org' 
  end


  def teardown
    @browser.quit
  end


end

