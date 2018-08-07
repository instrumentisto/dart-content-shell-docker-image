Dart with Content Shell Docker image
====================================

[![GitHub release](https://img.shields.io/github/release/instrumentisto/dart-content-shell-docker-image.svg)](https://hub.docker.com/r/instrumentisto/dart-content-shell/tags) [![Build Status](https://travis-ci.org/instrumentisto/dart-content-shell-docker-image.svg?branch=master)](https://travis-ci.org/instrumentisto/dart-content-shell-docker-image) [![Docker Pulls](https://img.shields.io/docker/pulls/instrumentisto/dart-content-shell.svg)](https://hub.docker.com/r/instrumentisto/dart-content-shell) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/instrumentisto/dart-content-shell-docker-image/blob/master/LICENSE.md)

This image is a wrapper of [official Google Dart image][1] that contains [Content Shell][2] for running browser tests.

> [www.dartlang.org](https://www.dartlang.org)  
> [hub.docker.com/r/google/dart](https://hub.docker.com/r/google/dart)




## Status

__PROJECT IS CLOSED AND ARCHIVED. NO MAINTAINING WILL BE CONTINUED.__




## How to use this image

Just map your working directory to `/app` inside container:
```bash
docker run --rm -v $(pwd):/app instrumentisto/dart-content-shell pub run test
```

Make sure that you populate your [pub cache][4] correctly.
```bash
docker run --rm -v $(pwd):/app \
           -e PUB_CACHE=/path/to/.pub-cache \
           -v /path/to/.pub-cache:/path/to/.pub-cache \
       instrumentisto/dart-content-shell pub run test
```




## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue][3].




[1]: https://hub.docker.com/r/google/dart
[2]: https://github.com/google/test_runner.dart#tools-and-environment
[3]: https://github.com/instrumentisto/dart-content-shell-docker-image/issues 
[4]: https://www.dartlang.org/tools/pub/installing#optional-environment-variables
