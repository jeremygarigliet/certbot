# ITH Certbot

Used to generate LetsEncrypt wildcard certificates.  
After creating the certificates, fullchain and privkey will be concatenated into  
- `./ssl/<DOMAIN>/<DOMAIN>.pem`

## Build

```bash
docker build -t jeremygarigliet/certbot .
```

## Run

```bash
docker run \
  -ti \
  --rm \
  -v $(pwd)/ssl:/etc/letsencrypt/archive \
  -e EMAIL="email@address.here" \
  jeremygarigliet/certbot "domain.com"
```