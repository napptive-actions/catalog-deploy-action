# CATALOG-DEPLOY-ACTION

This repo contains a github action that allows to deploy an application from Napptive catalog.

Napptive playground simplifies the process to depoy and maintenance cloud-native applications. [Try for free!!](https://playground.napptive.dev/login)

## What is Napptive Catalog

Napptive catalog contains a collection of applications ready to be deployed. The applications in the catalog are available to all users of the platform.

## References

* [Catalog documentation](https://docs.napptive.com/Catalog.html)
* [Catalog repository](https://github.com/napptive/catalog-manager)

## Availabe Applications

You can list available applications executing:

```bash
playground catalog list
```

## Environment variable

### `PLAYGROUND_PAT`

This environment variable contains a [Napptive Personal Access Token]((https://docs.napptive.com/guides/Using_personal_access_tokens.html)) used to login to the platform.

## Inputs

### `appName`

With the name of the application to deploy. In Napptive Catalog, the name of the application follows the following convention: *`namespace/appName:tag`*. This input is __required__

### `environment`

To specify a target account/environment if proceed. No __required__ input.

### `playgroundConfigFile`

To use a custom YAML file to change the target playground installation. No __required__
This file contains a playground installation configuration. Visit [documentation](https://docs.napptive.com/playground/On_premise_configuration.html#configuration-file) for an example.

## Example usage

```bash
name: Deploy to Napptive Playground from Catalog
on: [push]
jobs:
  deploy:
    name: Catalog deploy
    runs-on: ubuntu-latest
    steps:
      # Get a copy of the repo.
      - uses: actions/checkout@v2
      # Deploying napptive/drawio:14.3.0 from the catalog
      - uses: napptive-actions/catalog-deploy-action@v4.1.0
        env:
          PLAYGROUND_PAT: ${{ secrets.PLAYGROUND_PAT }}
        with:
          appName: "napptive/drawio:14.3.0"

```

## License

Copyright 2020 Napptive

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at:

[https://www.apache.org/licenses/LICENSE-2.0](https://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
