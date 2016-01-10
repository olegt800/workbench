require 'selenium-webdriver'
require 'test/unit'

class LoginTest < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
  end

  def test_positive_create_project
    go_to_home_page

    # login phase
  @browser.find_element(:class, 'login').click
  @browser.find_element(:id, 'username').send_keys 'olegt800'
  @browser.find_element(:id, 'password').send_keys 'user4444'
  @browser.find_element(:name, 'login').click
  # create project phase
  random = rand(999).to_s
  @browser.find_element(:class, 'projects').click
  @browser.find_element(:class, 'icon-add').click
  @browser.find_element(:id, 'project_name').send_keys 'proj01'
  @browser.find_element(:id, 'project_description').send_keys 'some info should be here'
  @browser.find_element(:id, 'project_identifier').send_keys 'a' + random
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


