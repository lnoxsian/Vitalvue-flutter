SHELL := /bin/bash

FLUTTER ?= flutter
JAVA_DIST ?= temurin@17
BUILD_MODE ?= release
SPLIT_ABI ?= false
BUILD_TARGET ?= apk
DOCKER_COMPOSE ?= docker compose

.PHONY: help java java17 pub-get test run clean build build-apk build-appbundle build-ios build-web docker-build docker-build-apk docker-build-appbundle

help:
	@echo "Available targets:"
	@echo "  make java        # Switch Java with: javm use $(JAVA_DIST)"
	@echo "  make java17      # Alias for make java"
	@echo "  make pub-get     # Install Flutter dependencies"
	@echo "  make test        # Run Flutter tests"
	@echo "  make run         # Run Flutter app"
	@echo "  make clean       # Flutter clean + pub get"
	@echo "  make build       # Build APK (BUILD_MODE=release|debug|profile SPLIT_ABI=true|false)"
	@echo "  make build-apk   # Build APK with BUILD_MODE/SPLIT_ABI"
	@echo "  make build-appbundle # Build App Bundle with BUILD_MODE"
	@echo "  make build-ios   # Build iOS (no codesign)"
	@echo "  make build-web   # Build Web"
	@echo "  make docker-build # Docker build (BUILD_TARGET=apk|appbundle BUILD_MODE=... SPLIT_ABI=...)"
	@echo "  make docker-build-apk # Docker APK build"
	@echo "  make docker-build-appbundle # Docker App Bundle build"

java:
	@command -v javm >/dev/null 2>&1 || { echo "javm not found in PATH"; exit 1; }
	javm use $(JAVA_DIST)

java17: java

pub-get:
	$(FLUTTER) pub get

test:
	$(FLUTTER) test

run:
	$(FLUTTER) run

clean:
	$(FLUTTER) clean
	$(FLUTTER) pub get

build: build-apk

build-apk:
	$(FLUTTER) build apk --$(BUILD_MODE) $(if $(filter true,$(SPLIT_ABI)),--split-per-abi,)

build-appbundle:
	$(FLUTTER) build appbundle --$(BUILD_MODE)

build-ios:
	$(FLUTTER) build ios --no-codesign

build-web:
	$(FLUTTER) build web

docker-build:
	BUILD_TARGET=$(BUILD_TARGET) BUILD_MODE=$(BUILD_MODE) SPLIT_ABI=$(SPLIT_ABI) $(DOCKER_COMPOSE) run --rm flutter-builder

docker-build-apk:
	BUILD_TARGET=apk BUILD_MODE=$(BUILD_MODE) SPLIT_ABI=$(SPLIT_ABI) $(DOCKER_COMPOSE) run --rm flutter-builder

docker-build-appbundle:
	BUILD_TARGET=appbundle BUILD_MODE=$(BUILD_MODE) SPLIT_ABI=false $(DOCKER_COMPOSE) run --rm flutter-builder