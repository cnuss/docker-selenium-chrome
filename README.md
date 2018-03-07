# docker-selenium-firefox

[![Build Status](https://travis-ci.org/cnuss/docker-selenium-firefox.svg?branch=master)](https://travis-ci.org/cnuss/docker-selenium-firefox)

A Docker container that installs:
 - Xvfb (Virtual Display)
 - Firefox
 - Python
 - Selenium
 - Geckodriver

 It also provides a sample script to get you started to run a Selenium session.

# Building (Locally)

```
docker build --tag docker-selenium-firefox:latest .
```

# Running (Locally)

```
docker run docker-selenium-firefox:latest
```

# Customizing (Quick 'n Dirty Example)

1. Create your own repository
2. Create your script (`run_test.py`, for example)
3. Add the following Dockerfile:

```
FROM cnuss/docker-selenium-firefox:latest

ADD run_test.py /opt/bin
CMD ["/opt/bin/launcher", "/opt/bin/run_test.py"]
```

This effectively overrides the `CMD` that runs `simple_test.py`, but still leverages `launcher` so the display get's set up for you!
