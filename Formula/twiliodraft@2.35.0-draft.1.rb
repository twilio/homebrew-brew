require "language/node"

class TwiliodraftAT2350Draft1 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/twilio-cli/releases/download/2.35.0-draft.1/twilio-2.35.0-draft.1.tar.gz"
  version "2.35.0-draft.1"
  sha256 "0188f76a777db87fea4cb35868cdbfbbe5b8e84bd3ca04b13db46fb353342df4"
  depends_on "node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    pid = spawn("node #{libexec}/welcome.js")
    Process.wait pid
  end
end