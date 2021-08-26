require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.28.1/twilio-v2.28.1.tar.gz"
  version "2.28.1"
  sha256 "99596cc830f6bf67732e96e1c396216016620296f9b997a5570eb571a3f618e3"
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
