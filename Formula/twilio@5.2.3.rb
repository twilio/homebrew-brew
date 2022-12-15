require "language/node"

class TwilioAT523 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v5.2.3/twilio-v5.2.3.tar.gz"
  version "5.2.3"
  sha256 "474a258e42870023f9f8cff97d8c120027507e262d8f60871fdc8de9f37b83cd"
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
