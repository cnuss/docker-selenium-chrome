#!/usr/bin/env python

from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = Options()
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
options.set_headless(True)

browser = webdriver.Chrome(options=options, service_args=["--verbose", "--log-path=/tmp/chrome.log"])
browser.get('https:/github.com/cnuss')
browser.save_screenshot('/tmp/screenshot.png')

title = browser.title

browser.quit()

assert ("cnuss" in title)
