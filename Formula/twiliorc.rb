require "language/node"

class Twiliorc < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/channels/rc/twilio-v6.0.0-rc.1/twilio-v6.0.0-rc.1.tar.gz"
  version "6.0.0-rc.1"
  sha256 "4f0047dd6f1768179836ba5a9a9db52a1821be730d7e213f56260d33407e452e"
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