COVERAGE_FILE := coverage.out

test: acceptance

coverage: unit
	go tool cover -html=$(COVERAGE_FILE)

acceptance: build unit
	bats test

build: build-dependencies
	go build -o bin/pomodoro

install: build
	cp ./bin/pomodoro ~/bin/pomodoro

build-dependencies:
	go get -t
	go get golang.org/x/tools/cmd/cover

unit: build-dependencies
	go test -coverprofile=$(COVERAGE_FILE) -timeout 25ms

lint: lint-dependencies
	gometalinter ./...

lint-dependencies:
	go get github.com/alecthomas/gometalinter
	gometalinter --install

.PHONY: acceptance build build-dependencies coverage dependencies lint lint-dependencies unit
