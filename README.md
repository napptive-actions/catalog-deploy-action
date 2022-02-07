# CATALOG-DEPLOY-ACTION

This repo contains a github action that allows to deploy an application from Napptive catalog.

## Environment variable

### `PLAYGROUND_PAT`

This environment variable contains a Napptive Personal Access Token. Visit [Napptive documentation](https://docs.napptive.com/guides/Using_personal_access_tokens.html) to know how to create it.

## Inputs

### `appName`

The name of the application to deploy `appName:tag`. This application should be stored in the Napptive catalog. This input is __required__

### `environment`

To specify a target account/environment if proceed. No __required__ input.

### `config`

To use a custom YAML file to change the target playground installation. No __required__

## Example usage

```bash
name: Deploy to Napptive Playground from Catalog
on: [push]
jobs:
  deploy:
    name: Playground deploy
    runs-on: ubuntu-latest
    steps:
      # Get a copy of the repo.
      - uses: actions/checkout@v2
      # Deploying napptive/drawio:14.3.0 from the catalog
      - uses: napptive-actions/playground-catalog-deploy@master
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