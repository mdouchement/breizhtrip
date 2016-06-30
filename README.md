# BreizhTrip

Carte interactive pour découvrir le patrimoine breton recensé
Interactive map to discover listed breton heritage

![Desc](https://github.com/mdouchement/breizhtrip/blob/master/screencapture.png)


## Requirements
- MRI 2.3.0
- Postgres 9.5 [configuration file](https://github.com/mdouchement/breizhtrip/blob/master/config/database.yml)

## Development

```sh
# Install and configure db
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate

# Launch app
$ bundle exec rails s
```

## Production with Docker

- Start Postgres server
```sh
$ docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres:latest
```

- Create/migrate database
```sh
$ docker run --rm \
  -e BREIZHTRIP_DATABASE_HOST=192.168.20.42 \
  -e BREIZHTRIP_DATABASE_PORT=5432 \
  -e BREIZHTRIP_DATABASE_USERNAME=postgres \
  -e BREIZHTRIP_DATABASE_PASSWORD=postgres \
  -it mdouchement/breizhtrip:latest bundle exec rake db:create

$ docker run --rm \
  -e BREIZHTRIP_DATABASE_HOST=192.168.20.42 \
  -e BREIZHTRIP_DATABASE_PORT=5432 \
  -e BREIZHTRIP_DATABASE_USERNAME=postgres \
  -e BREIZHTRIP_DATABASE_PASSWORD=postgres \
  -it mdouchement/breizhtrip:latest bundle exec rake db:migrate
```

- Start BreizhTrip
```sh
$ docker run --name breizhtrip \
  -e BREIZHTRIP_DATABASE_HOST=192.168.20.42 \
  -e BREIZHTRIP_DATABASE_PORT=5432 \
  -e BREIZHTRIP_DATABASE_USERNAME=postgres \
  -e BREIZHTRIP_DATABASE_PASSWORD=postgres \
  -e RAILS_SERVE_STATIC_FILES=true \
  -p 3000:3000 -d mdouchement/breizhtrip:latest

# or with linked Postgres server container
$ docker run --name breizhtrip \
  --link postgres:psqlhost \
  -e BREIZHTRIP_DATABASE_HOST=psqlhost \
  -e BREIZHTRIP_DATABASE_PORT=5432 \
  -e BREIZHTRIP_DATABASE_USERNAME=postgres \
  -e BREIZHTRIP_DATABASE_PASSWORD=postgres \
  -e RAILS_SERVE_STATIC_FILES=true \
  -p 3000:3000 -d mdouchement/breizhtrip:latest
```
To set any environment variable in the container, use one or more `-e` flags:
- `BREIZHTRIP_NAMESPACE` → namespace the url
- `RAILS_SERVE_STATIC_FILES` → the webapp serves all the assets instead of NGINX
- `BREIZHTRIP_DATABASE_POOL` → database connection pool size
- `BREIZHTRIP_DATABASE_HOST` → database host (IP address or URL)
- `BREIZHTRIP_DATABASE_PORT` → database port (by default 5432)
- `BREIZHTRIP_DATABASE_USERNAME` → database credential
- `BREIZHTRIP_DATABASE_PASSWORD` → database credential

# Load legacy file

```sh
$ bundle exec rake 'legacy:load[inventaire_patrimoine.json]'
```
> https://www.data.gouv.fr/fr/datasets/inventaire-du-patrimoine-breton/

> https://inspire.data.gouv.fr/api/geogw/services/556c6042330f1fcd4833794d/feature-types/rb:inventaire_patrimoine/download?format=GeoJSON&projection=WGS84

### Enriched dataset
```sh
$ bundle exec rake 'legacy:load_tsv[final.tsv]'
```
> https://mega.nz/#!N1tTSQ6b!feq9miUz7Ff80ctzwP4HfUQht39MIbCmkSI0woKxhw8

## License

MIT. See the [LICENSE](https://github.com/mdouchement/breizhtrip/blob/master/LICENSE) for more details.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Ensure specs and Rubocop pass
5. Push to the branch (git push origin my-new-feature)
6. Create new Pull Request
