FROM jitsi/web
RUN rm -rf /usr/share/jitsi-meet/css/all.css
COPY ./css/all.css /usr/share/jitsi-meet/css/
COPY ./images/* /usr/share/jitsi-meet/images/
RUN rm -rf /usr/share/jitsi-meet/interface_config.js
COPY ./interface_config.js /usr/share/jitsi-meet/
RUN rm -rf /usr/share/jitsi-meet/title.html
COPY ./title.html /usr/share/jitsi-meet/
