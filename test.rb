require "rubygems"
require "watir-webdriver"
browser = Watir::Browser.new(:chrome)
browser.goto("http://google.com")    
browser.driver.manage.window.maximize