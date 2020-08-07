require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"

  opoo "Twilio is switching the default branch from 'master' to 'main'"
  opoo "requiring an update to the default homebrew tap."
  opoo ""

  odie """To upgrade twilio-cli, retap it with:
    brew untap twilio/brew
    brew tap twilio/brew
    brew upgrade twilio"""
end
