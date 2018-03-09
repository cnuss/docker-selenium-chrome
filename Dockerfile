FROM ubuntu:16.04

ENV CHROME_VERSION 65.0.3325.146-1
ENV CHROMEDRIVER_VERSION 2.36

RUN \
	# REQUIREMENTS \
	apt-get update -qqy && \
    apt-get install -y --no-install-recommends wget python-pip unzip && \
    \
    # CHROME \ 
    wget -q --continue --output-document /opt/chrome.deb "http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb" && \
    apt install -y /opt/chrome.deb && \
    rm /opt/chrome.deb && \
    \
    # CHROMEDRIVER \
    wget -q --continue --output-document /opt/chromedriver.zip "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip" && \
    unzip -q /opt/chromedriver.zip -d /usr/bin && \
    rm /opt/chromedriver.zip && \
    \
    # SELENIUM \
    pip --no-cache-dir --disable-pip-version-check --quiet install selenium && \
    \
    # CLEANUP \
    rm -rf /var/lib/apt/lists/* && \
    \
    mkdir -p /opt/bin

ADD simple_test.py /opt/bin

CMD ["/usr/bin/python", "/opt/bin/simple_test.py"]
