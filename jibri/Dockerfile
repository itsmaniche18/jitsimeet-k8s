FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install linux-image-extra-virtual -y
RUN apt-get install sudo -y
RUN sudo apt-get update -y
RUN sudo apt-get install ffmpeg -y
RUN apt-get install curl -y
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update
RUN apt-get -y install google-chrome-stable
RUN mkdir -p /etc/opt/chrome/policies/managed
RUN echo '{ "CommandLineFlagSecurityWarningsEnabled": false }' >>/etc/opt/chrome/policies/managed/managed_policies.json
RUN curl -sS https://chromedriver.storage.googleapis.com/LATEST_RELEASE > /opt/file.txt
RUN wget -N http://chromedriver.storage.googleapis.com/$(cat /opt/file.txt)/chromedriver_linux64.zip -P ~/
RUN apt-get install unzip -y
RUN unzip ~/chromedriver_linux64.zip -d ~/
RUN sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
RUN sudo chown root:root /usr/local/bin/chromedriver
RUN sudo chmod 0755 /usr/local/bin/chromedriver
RUN sudo apt-get -y install default-jre-headless
RUN sudo apt-get -y install ffmpeg 
RUN sudo apt-get -y install curl 
RUN sudo apt-get -y install alsa-utils 
RUN sudo apt-get -y install icewm 
RUN sudo apt-get -y install xdotool 
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get -yq install xserver-xorg-input-void
RUN sudo apt-get -y install xserver-xorg-video-dummy
RUN wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
RUN sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
RUN apt-get install apt-transport-https
RUN sudo apt-get update -y
RUN sudo apt-get install jibri
RUN sudo usermod -aG adm,audio,video,plugdev jibri

RUN apt install openjdk-8-jdk -y
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
RUN echo JAVA_HOME=\"/usr/lib/jvm/java-8-openjdk-amd64\" >> /etc/environment
RUN . /etc/environment

COPY config/config.json /etc/jitsi/jibri/
COPY git_rep/ /opt/
COPY config/scripts.sh /opt/
RUN chown jibri:jibri opt/scripts.sh
RUN chmod a+x /opt/scripts.sh

RUN echo "Asia/Kolkata" > /etc/timezone
RUN apt-get update && apt-get install vim -y

USER jibri

ENV DISPLAY=:0

CMD ["/opt/scripts.sh"]
