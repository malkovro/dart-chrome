FROM google/dart:latest

RUN DEBIAN_FRONTEND=noninteractive \
 && echo 'deb http://dl.google.com/linux/chrome/deb stable main' \
                                 >> /etc/apt/sources.list.d/google-chrome.list \
 && curl -fL https://dl-ssl.google.com/linux/linux_signing_key.pub \
                                                               | apt-key add - \
 && apt-get update \
    \
 && apt-get install --no-install-recommends -y -q \
            google-chrome-stable \
    \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

CMD [ echo "Coucou! I am $(whoami)!" ]