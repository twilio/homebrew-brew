require "language/node"

class TwilioAT301 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/twilio-cli/releases/download/3.0.1/twilio-3.0.1.tar.gz"
  version "3.0.1"
  sha256 "6164f1a6d0337e996e7208fe3c81f6361bda4af9093dbb528435ce538e5341bb"
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
