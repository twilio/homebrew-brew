#!/usr/bin/env bash

set -ex

brew update
brew install Formula/twilio.rb
brew link --overwrite twilio # WARNING: Nukes existing Twilio CLI install
twilio version
twilio help
brew uninstall Formula/twilio.rb
