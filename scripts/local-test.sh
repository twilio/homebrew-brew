#!/usr/bin/env bash

set -ex

brew update
brew install Formula/twilio-cli.rb
brew link --overwrite twilio-cli
twilio version
twilio help
brew uninstall Formula/twilio-cli.rb
