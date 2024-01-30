require "language/node"

class TwilioAT5170 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v5.17.0/twilio-v5.17.0.tar.gz"
  version "5.17.0"
  sha256 "05fb4efb10f5f0db15382716e00bba0b480c43bd2933a79b001a4910af5b69c1"
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
