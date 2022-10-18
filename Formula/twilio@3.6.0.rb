require "language/node"

class TwilioAT360 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/twilio-cli/releases/download/3.6.0/twilio-3.6.0.tar.gz"
  version "3.6.0"
  sha256 "c425ff481e4a180631b931dcd124d555c358a4b6703c6fd2e1275ee415d0f814"
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
