require "language/node"

class Twiliorc < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/twilio-cli/releases/download/2.33.0-rc.2/twilio-2.33.0-rc.2.tar.gz"
  version "2.33.0-rc.2"
  sha256 "bb8252cca1cce30051da332fc46141938c6339b14d9e1d3164669a68854e72d3"
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