require "language/node"

class TwiliodraftAT310Draft2 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/channels/draft/twilio-v3.1.0-draft.2/twilio-v3.1.0-draft.2.tar.gz"
  version "3.1.0-draft.2"
  sha256 "8a43bb3b8a93e0c221d971be30ad96e4ffb38d85bcb1d006671aa57992761e4f"
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
