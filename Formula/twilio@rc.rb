require "language/node"

class TwilioATrc < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.27.0-rc.1/twilio-v2.27.0-rc.1.tar.gz"
  version "2.27.0-rc.1"
  sha256 "919ff4d3df952e61506f967dc63d0ad007a30a0ac0e78b22747a3aa93fd02139"
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