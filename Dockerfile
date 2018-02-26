FROM ubuntu:16.04

ENV FIREFOX_VERSION 58.0.2
ENV GECKODRIVER_VERSION 0.19.1

RUN apt-get update -qqy
RUN apt-get install -y wget xvfb bzip2 python-pip libgtk-3-dev libdbus-glib-1-dev

ENV FIREFOX_DIR /usr/bin/firefox
ENV FIREFOX_FILENAME $FIREFOX_DIR/firefox.tar.bz2

RUN mkdir $FIREFOX_DIR
RUN wget -q --continue --output-document $FIREFOX_FILENAME "https://ftp.mozilla.org/pub/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/en-US/firefox-${FIREFOX_VERSION}.tar.bz2"
RUN tar -xjf $FIREFOX_FILENAME --strip-components=1 --directory "$FIREFOX_DIR"

ENV PATH $FIREFOX_DIR:$PATH

ENV GECKODRIVER_DIR /usr/bin/geckodriver
ENV GECKODRIVER_FILENAME $GECKODRIVER_DIR/geckodriver.tar.gz

RUN mkdir $GECKODRIVER_DIR
RUN wget -q --continue --output-document $GECKODRIVER_FILENAME "https://github.com/mozilla/geckodriver/releases/download/v${GECKODRIVER_VERSION}/geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz"
RUN tar -xzf $GECKODRIVER_FILENAME --directory "$GECKODRIVER_DIR"

ENV PATH $GECKODRIVER_DIR:$PATH

RUN pip --disable-pip-version-check --quiet install selenium

RUN which python

ADD test.py /
ADD launcher /

CMD ["/launcher"]
