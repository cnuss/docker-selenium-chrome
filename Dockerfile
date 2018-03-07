FROM ubuntu:16.04

ENV FIREFOX_VERSION 58.0.2
ENV GECKODRIVER_VERSION 0.19.1

ENV FIREFOX_DIR /usr/bin/firefox
ENV FIREFOX_FILENAME $FIREFOX_DIR/firefox.tar.bz2

ENV GECKODRIVER_DIR /usr/bin/geckodriver
ENV GECKODRIVER_FILENAME $GECKODRIVER_DIR/geckodriver.tar.gz

ENV PATH $FIREFOX_DIR:$GECKODRIVER_DIR:$PATH

RUN \
	# REQUIREMENTS \
	apt-get update -qqy && \
    apt-get install -y --no-install-recommends wget xvfb bzip2 python-pip libgtk-3-dev libdbus-glib-1-dev && \
    \
    # FIREFOX \ 
    mkdir $FIREFOX_DIR && \
    wget -q --continue --output-document $FIREFOX_FILENAME "https://ftp.mozilla.org/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2" && \
    tar -xjf $FIREFOX_FILENAME --strip-components=1 --directory "$FIREFOX_DIR" && \
    rm $FIREFOX_FILENAME && \
    \
    # GECKODRIVER \
    mkdir $GECKODRIVER_DIR && \
    wget -q --continue --output-document $GECKODRIVER_FILENAME "https://github.com/mozilla/geckodriver/releases/download/v${GECKODRIVER_VERSION}/geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz" && \
    tar -xzf $GECKODRIVER_FILENAME --directory "$GECKODRIVER_DIR" && \
    rm $GECKODRIVER_FILENAME && \
    \
    # SELENIUM \
    pip --no-cache-dir --disable-pip-version-check --quiet install selenium && \
    \
    # CLEANUP \
    apt-get remove -y wget bzip2 && \
    rm -rf /var/lib/apt/lists/* && \
    \
    mkdir -p /opt/bin

ADD launcher /opt/bin
ADD simple_test.py /opt/bin

CMD ["/opt/bin/launcher", "/opt/bin/simple_test.py"]
