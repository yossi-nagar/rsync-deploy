FROM debian:10-slim

RUN apt update
RUN apt -yq install rsync scp openssh-client


# Label
LABEL "com.github.actions.name"="Deploy with rsync"
LABEL "com.github.actions.description"="Deploy to a remote server using rsync over ssh"
LABEL "com.github.actions.color"="purple"
LABEL "com.github.actions.icon"="truck"

LABEL "repository"="http://github.com/yossi-nagar/rsync-deploy"
LABEL "homepage"="https://github.com/yossi-nagar/rsync-deploy"
LABEL "maintainer"="Yossi Nagar <yossin@cliotech.com>"


ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
