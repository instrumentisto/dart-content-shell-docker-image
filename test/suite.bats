#!/usr/bin/env bats


@test "dart is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'which dart'
  [ "$status" -eq 0 ]
}

@test "dart runs ok" {
  run docker run --rm --entrypoint sh $IMAGE -c 'dart --help'
  [ "$status" -eq 0 ]
}

@test "dart has correct version" {
  run sh -c 'cat Makefile | grep "VERSION ?= " | cut -d " " -f 3 | tr -d "\n"'
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  expected="$output"

  run docker run --rm --entrypoint sh $IMAGE -c \
    "dart --version 2>&1 | grep 'Dart VM version: $expected'"
  [ "$status" -eq 0 ]
}


@test "xvfb-run is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'which xvfb-run'
  [ "$status" -eq 0 ]
}

@test "xvfb-run runs ok" {
  run docker run --rm --entrypoint sh $IMAGE -c 'xvfb-run --help'
  [ "$status" -eq 0 ]
}


@test "content_shell is installed" {
  run docker run --rm --entrypoint sh $IMAGE -c 'which content_shell'
  [ "$status" -eq 0 ]
}

@test "content_shell runs ok" {
  run docker run --rm $IMAGE 'content_shell --dump-render-tree google.com'
  [ "$status" -eq 0 ]
}


@test "post_push hook is up-to-date" {
  run sh -c "cat Makefile | grep 'TAGS ?= ' | cut -d ' ' -f 3"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  expected="$output"

  run sh -c "cat hooks/post_push | grep 'for tag in' | cut -d '{' -f 2 | cut -d '}' -f 1"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  actual="$output"

  [ "$actual" = "$expected" ]
}
