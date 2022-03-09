# This file is licensed under the Affero General Public License version 3 or
# later. See the COPYING file.
app_name=$(notdir $(CURDIR))

all: dev-setup lint build-js-production release

# Dev env management
dev-setup: clean clean-dev npm-init

npm-init:
	npm ci

npm-update:
	npm update

# Building
build-js:
	npm run dev

build-js-production:
	npm run build

watch-js:
	npm run watch

# Testing
test:
	npm run test

test-watch:
	npm run test:watch

test-coverage:
	npm run test:coverage

test-cypress:
	./cypress/start.sh
	npm run cypress:gui
	./cypress/stop.sh

test-cypress-kill:
	./cypress/stop.sh

# Linting
lint:
	npm run lint

lint-fix:
	npm run lint:fix

# Style linting
stylelint:
	npm run stylelint

stylelint-fix:
	npm run stylelint:fix

# Cleaning
clean:
	rm -rf js/

clean-dev:
	rm -rf node_modules

release:
	zip -r release.zip . -x "node_modules/*" "tests/*" "vendor/*" ".github/*"
