require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.31.0/twilio-v2.31.0.tar.gz"
  version "2.31.0"
  sha256 "54ef878cef26e032d6d2518606b61417d5ee5666a2ab6cb79031e196dd5a4ec9"
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
