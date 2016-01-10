require 'selenium-webdriver'
require 'test/unit'

class LoginTest < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
  end

  def test_positive_add_user_to_project
    go_to_home_page

     #Login phase
    wait = Selenium::WebDriver::Wait.new(:timeout => 2)
    wait.until { @browser.find_element(:class, 'login')}
    @browser.find_element(:class, 'login').click
    wait.until { @browser.find_element(:id, 'username')}
    @browser.find_element(:id, 'username').send_keys 'olegt800'
    @browser.find_element(:id, 'password').send_keys 'user4444'
    @browser.find_element(:name, 'login').click
     #Add user to project phase
    @browser.find_element(:class, 'projects').click
    @browser.find_element(:id, 'q').send_keys('proj01', :return)
    sleep(1)
    @browser.find_element(:class, 'token-0').click
    @browser.find_element(:class, 'settings').click
    @browser.find_element(:id, 'tab-members').click
    @browser.find_element(:class,"icon-add").click
    sleep(1)
    @browser.find_element(:css,"html fieldset.box p input#principal_search.autocomplete").send_keys 'test_user'
    sleep(1)
    @browser.find_element(:css, 'html fieldset.box div#principals_for_new_member div.objects-selection div#principals label input').click
    @browser.find_element(:css,'html fieldset.box div.roles-selection label input').click
    @browser.find_element(:id,"member-add-submit").click


    assert_equal(true, @browser.find_element(:css,'tr#member-127398.odd.member td.roles span#member-127398-roles').displayed?)
  end

  def go_to_home_page
    @browser.get 'http://demo.redmine.org'
  end


  def teardown
    @browser.quit
  end


end


