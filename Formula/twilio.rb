require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.30.0/twilio-v2.30.0.tar.gz"
  version "2.30.0"
  sha256 "5fc2378dbfaf14834a97fc247e76501bb717816bf9f23b1bd36b9bbb2b5c4318"
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    pid = spawn("node #{libexec}/welcome.js")
    Process.wait pid
  end
end
