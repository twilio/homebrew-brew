require "language/node"

class TwilioAT420 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/twilio-cli/releases/download/4.2.0/twilio-4.2.0.tar.gz"
  version "4.2.0"
  sha256 "6c4d28730c689034500a0f52214fff41dccd6e2ffa7ecd702799bdd2615a9d2a"
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
