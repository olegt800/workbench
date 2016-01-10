require 'selenium-webdriver'
require 'test/unit'

class LoginTest < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
  end

  def test_add_proj_version
    go_to_home_page
#login test
    @browser.find_element(:class, 'login').click
    @browser.find_element(:id, 'username').send_keys 'olegt800'
    @browser.find_element(:id, 'password').send_keys 'user4444'
    @browser.find_element(:name, 'login').click
# ((create project))
#wait = Selenium::WebDriver::Wait.new(:timeout => 3)
#wait.until { browser.find_element(:class, 'contextual') }

# add proj version
    @browser.find_element(:class, 'projects').click
    @browser.find_element(:id, 'q').send_keys('proj01', :return)
    @browser.find_element(:class, 'token-0').click
    @browser.find_element(:class, 'settings').click
    @browser.find_element(:id, 'tab-versions').click
    @browser.find_element(:css,"div#tab-content-versions.tab-content p a.icon.icon-add").click
    @browser.find_element(:id, 'version_name').send_keys 'ver1' +rand(99).to_s
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





