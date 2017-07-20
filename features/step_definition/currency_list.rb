require 'watir'
require 'cucumber'

Given(/^a user login to application$/) do
  @browser=Watir::Browser.new :chrome
  @browser.goto "http://www.exercise1.com"
end

When(/^they go to currency page$/) do
  @dashboard_page = Object.const_get(page_name.gsub("",""))
  @dashboard_page.visit
end

Then(/^they see five records in currency table$/) do
  @dashboard_page.verify_total_fields()
end

Then(/^they see all the values in currency format$/) do
  @dashboard_page.verify_currency_format()
end

Then(/^they see all the values are greater than 0$/) do
  @dashboard_page.verify_values_not_zero()
end

Then(/^they see the total balance is sum of all listed values$/) do
  @dashboard_page.verify_total_balance()
end