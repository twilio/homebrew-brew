require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://d10x3k7rlyta2i.cloudfront.net/twilio-v5.8.1/twilio-v5.8.1.tar.gz"
  version "5.8.1"
  sha256 "083e92608e783765717b32efb692dfecb69e4910133a32f9a4d52e1a3ecb07bb"
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
