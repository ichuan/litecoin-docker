# litecoin-docker
Dockerfile for litecoin (<https://github.com/litecoin-project/litecoin>)


# Building

```bash
docker build -t litecoin .
```

# Running

Customize config file `coin.conf` first.

```bash
# block dir
mkdir data
docker run --rm -itd --name btc -p 8332:8332 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf litecoin
```

# Using pre-built docker image

```bash
docker run --rm -itd --name btc -p 8332:8332 -v `pwd`/data:/opt/coin/data -v `pwd`/coin.conf:/opt/coin/coin.conf wshub/litecoin
```
