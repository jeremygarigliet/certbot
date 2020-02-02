# ITH Certbot

Used to generate LetsEncrypt wildcard certificates.  
After creating the certificates, fullchain and privkey will be concatenated into  
- `./ssl/<DOMAIN>/<DOMAIN>.pem`

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