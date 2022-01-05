FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]

RUN mkdir -p /opt/coin
WORKDIR /opt/coin

RUN apt-get update && apt-get install -y wget python
RUN wget https://download.litecoin.org/litecoin-0.18.1/linux/litecoin-0.18.1-x86_64-linux-gnu.tar.gz -O - | tar --strip-components 1 -C /opt/coin -xzf -

# cleanup
RUN apt remove -y wget && apt autoremove -y && apt autoclean
RUN rm -rf /var/lib/apt/lists/* /opt/coin/bin/{litecoin-qt,test_litecoin,litecoin-wallet,litecoin-tx}

ENTRYPOINT ["/opt/coin/bin/litecoind"]
CMD ["-conf=/opt/coin/coin.conf"]
