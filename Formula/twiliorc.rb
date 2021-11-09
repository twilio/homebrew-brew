require "language/node"

class Twiliorc < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/channels/rc/twilio-v2.27.0-rc.1/twilio-v2.27.0-rc.1.tar.gz"
  version "2.33.0-rc.1"
  sha256 "40bb92c37c57421c2dfa6f97f175781ca8cd42dbc0219a07a7efcec91698cda5"
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