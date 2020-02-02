# ITH Certbot

Used to generate LetsEncrypt wildcard certificates

## Build

```bash
docker build -t ith/certbot .
```

## Run

```bash
docker run \
  -ti \
  -v $(pwd)/ssl:/etc/letsencrypt/archive \
  -e EMAIL="email@address.here" \
  ith/certbot "domain.com"
```