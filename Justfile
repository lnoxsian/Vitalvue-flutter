set shell := ["bash", "-cu"]

java_dist := "temurin@17"
flutter_bin := "flutter"
build_mode := "release"
split_abi := "false"
build_target := "apk"
docker_compose := "docker compose"

default:
	just --list

help:
	just --list

java:
	command -v javm >/dev/null 2>&1 || { echo "javm not found in PATH"; exit 1; }
	javm use {{java_dist}}

java17: java

pub-get:
	{{flutter_bin}} pub get

test:
	{{flutter_bin}} test

run:
	{{flutter_bin}} run

clean:
	{{flutter_bin}} clean
	{{flutter_bin}} pub get

build: build-apk

build-apk mode=build_mode split=split_abi:
	{{flutter_bin}} build apk --{{mode}} {{ if split == "true" { "--split-per-abi" } else { "" } }}

build-appbundle mode=build_mode:
	{{flutter_bin}} build appbundle --{{mode}}

build-ios:
	{{flutter_bin}} build ios --no-codesign

build-web:
	{{flutter_bin}} build web

docker-build target=build_target mode=build_mode split=split_abi:
	BUILD_TARGET={{target}} BUILD_MODE={{mode}} SPLIT_ABI={{split}} {{docker_compose}} run --rm flutter-builder

docker-build-apk mode=build_mode split=split_abi:
	BUILD_TARGET=apk BUILD_MODE={{mode}} SPLIT_ABI={{split}} {{docker_compose}} run --rm flutter-builder

docker-build-appbundle mode=build_mode:
	BUILD_TARGET=appbundle BUILD_MODE={{mode}} SPLIT_ABI=false {{docker_compose}} run --rm flutter-builder