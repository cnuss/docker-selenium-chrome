#!/usr/bin/env python

from selenium import webdriver
from selenium.webdriver.firefox.options import Options

options = Options()
options.set_headless(True)
options.set_preference("browser.privatebrowsing.autostart", True)

browser = webdriver.Firefox(firefox_options=options, log_path='/dev/stdout')
browser.get('https:/github.com/cnuss')
browser.save_screenshot('/tmp/screenshot.png')

title = browser.title

browser.quit()

assert ("cnuss" in title)
