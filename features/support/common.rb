class Common
  Before do
    @browser = browser
  end
   
  at_exit do
    browser.close
  end
end