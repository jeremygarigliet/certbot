# ITH Certbot

Used to generate HAProxy-ready LetsEncrypt wildcard certificates using automated DNS challenge.

## Build

```bash
docker build -t jeremygarigliet/certbot .
```

## Run

You can input variables through the run command, or by using a `.env` file.

The following variables are used :

| VARIABLE NAME | EXAMPLE | EXPLANATION |
| :-- | :-- | :-- |
| *EMAIL* | `admin@domain.com` | Email used for registration and recovery contact with Let's Encrypt. |
| *CERT_NAME* | `domain.com` | The name used to identify your certificate files. |
| *CERT_OPTS* | `-d domain.com -d *.domain.com` | The *certbot* options (in this case to specify the domain names to apply). |
| *DNS_INI* | `/absolute/path/to/dns.ini` | The path to the ini file containing credentials used for your registrar's DNS challenge. |

The following plugins are available :

- cloudflare
- digitalocean
- gandi
- google
- linode
- ovh

### Docker

```bash
EMAIL=admin@domain.com
CERT_NAME=domain.com
CERT_OPTS=-d domain.com -d *.domain.com
DNS_INI=/absolute/path/to/dns.ini

docker run \
  -ti \
  --rm \
  -e CERT_NAME=${CERT_NAME} \
  -e CERT_OPTS=${CERT_OPTS} \
  -e EMAIL=${EMAIL} \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v ${DNS_INI}:/root/dns.ini:ro \
  jeremygarigliet/certbot certgen <plugin>
```

### Docker-Compose

`docker-compose run --rm certbot certgen *<plugin>*`

You can specify different `.env` files using the `--env-file` option :

`docker-compose --env-file */path/to/file* run --rm certbot certgen <plugin>`
