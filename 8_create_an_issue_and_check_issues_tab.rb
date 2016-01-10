require 'selenium-webdriver'
require 'test/unit'

class LoginTest < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
  end

  def test_positive_create_project
    go_to_home_page

    #login phase
    wait = Selenium::WebDriver::Wait.new(:timeout => 2)
    wait.until { @browser.find_element(:class, 'login')}
    @browser.find_element(:class, 'login').click
    wait.until { @browser.find_element(:id, 'username')}
    @browser.find_element(:id, 'username').send_keys 'olegt800'
    @browser.find_element(:id, 'password').send_keys 'user4444'
    @browser.find_element(:name, 'login').click

    #Create issue and verify its presence in "Issues" tab
    @browser.find_element(:class, 'projects').click
    @browser.find_element(:id, 'q').send_keys('proj01', :return)
    sleep(1)
    @browser.find_element(:class, 'token-0').click
    @browser.find_element(:class, 'new-issue').click
    sleep(1)
    @browser.find_element(:id, 'issue_subject').send_keys 'bug1' + rand(99).to_s
    sleep(1)
    issue_status = @browser.find_elements(:css,'p select#issue_status_id option')
    issue_status[1].click
    sleep(1)
    issue_priority = @browser.find_elements(:css,'p select#issue_priority_id option')
    issue_priority[0].click
    @browser.find_element(:name, 'continue').click
    sleep(1)
    issue_num = @browser.find_element(css: 'div#flash_notice.flash.notice a').text.slice(1,6)
    @browser.find_element(:class, 'issues').click


    assert_equal(true, @browser.find_element(:link_text,issue_num).displayed?)
  end

  def go_to_home_page
    @browser.get 'http://demo.redmine.org'
  end


  def teardown
    @browser.quit
  end


end


