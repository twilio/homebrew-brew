require "language/node"

class TwilioAT330 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/twilio-cli/releases/download/3.3.0/twilio-3.3.0.tar.gz"
  version "3.3.0"
  sha256 "a75bd698b80a8eabdcdc8f511abb0e77b91ce1b025f82de4d741eaa25203f48d"
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
