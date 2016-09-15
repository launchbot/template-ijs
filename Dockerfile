# Create a new Dockerfile
FROM jupyter/notebook:latest

# launchbot-specific labels
LABEL name.launchbot.io="NodeJS"
LABEL workdir.launchbot.io="/usr/workdir"
LABEL description.launchbot.io="Notebook for NodeJS"
LABEL 8888.port.launchbot.io="iJS Notebook"

# assume ipython and ipython notebook taken care of by parent Dockerfile
USER root
RUN apt-get update -y
RUN apt-get install -y nodejs-legacy npm libzmq3-dev
RUN npm install -g ijavascript

EXPOSE 8888

WORKDIR /usr/workdir

CMD ijs --no-browser --port 8888 --ip=*
