# BreizhTrip

Some description

## Requirements
- MRI 2.3.0
- Postgres 9.5

# Load legacy file

```sh
bundle exec rake 'legacy:load[inventaire_patrimoine.json]'
```
> https://www.data.gouv.fr/fr/datasets/inventaire-du-patrimoine-breton/

> https://inspire.data.gouv.fr/api/geogw/services/556c6042330f1fcd4833794d/feature-types/rb:inventaire_patrimoine/download?format=GeoJSON&projection=WGS84


## License

MIT. See the [LICENSE](https://github.com/mdouchement/breizhtrip/blob/master/LICENSE) for more details.

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Ensure specs and Rubocop pass
5. Push to the branch (git push origin my-new-feature)
6. Create new Pull Request
