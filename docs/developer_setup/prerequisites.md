# Prerequisites

## FVM

Install [FVM](https://fvm.app/).

```sh
dart pub global activate fvm

# fvm --version
# 3.2.1
```

```sh
# In the root directory
fvm use 3.32.6
```

This is used to ensure that everyone who is coding on the flutter project is using the same flutter version.

## lcov

Install [lcov](https://github.com/linux-test-project/lcov).

```sh
brew intall lcov

# lcov --version
# lcov: LCOV version 2.3-1
```

This is used when creating a test coverage report.

## mkdocs

Install [mkdocs](https://www.mkdocs.org/) and the [material theme](https://github.com/squidfunk/mkdocs-material).

```sh
pip install mkdocs
```

```sh
pip install mkdocs-material
```

Also install libb2.

```sh
brew install libb2
```
