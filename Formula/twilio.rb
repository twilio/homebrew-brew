require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.29.1/twilio-v2.29.1.tar.gz"
  version "2.29.1"
  sha256 "e2e55d820169f33e2d3b4bc6673f9c471b6ce2a198d383ad81a0801e12c64f7a"
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
