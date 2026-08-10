# cpp_template

Template repository for C++ projects. After you create a new repository using
this one as template, search and replace all "my_project_name" with the desired
name.

## Build the Docker container image

```bash
docker build -f docker/Dockerfile -t my_project_name-dev:latest .
```

## Run a Docker container

```bash
docker run -it --rm --network=host --privileged -v .:/root/my_project_name -w /root/my_project_name my_project_name-dev:latest bash
```

## Build the project (inside the container)

```bash
bash -e /root/my_project_name/scripts/clean_build_install_test_release.sh
```

## Coverage

Do a clean instrumented build, run the tests and produce an HTML report. Fails
if line coverage falls below 80% (the threshold enforced in CI).

```bash
bash -e /root/my_project_name/scripts/coverage.sh
```

## API documentation

API docs are generated from the library headers with
[doxide](https://doxide.org) and rendered with
[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

```bash
bash -e /root/my_project_name/scripts/build_docs.sh
```

To preview with live reload, serve them (the container is run with
`--network=host`, so the site is reachable from the host):

```bash
mkdocs serve -a 0.0.0.0:8000
```

## Using VSCode

Needed extensions on the host PC:

```bash
code --force --install-extension ms-azuretools.vscode-containers
code --force --install-extension ms-vscode-remote.remote-containers
```
