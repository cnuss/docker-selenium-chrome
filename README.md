# docker-selenium-firefox

Initial Commit, I have selenium able to run inside a Docker container, using Firefox

# Building

```
docker build --tag docker-selenium-firefox:latest .
```

# Running

```
docker run docker-selenium-firefox:latest
```

# TODO
 - Provide a script instead of baking one in
 - Have Xvfb launch at container start
 - Try to run in AWS Fargate
 - Add travis CI