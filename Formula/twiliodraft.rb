require "language/node"

class Twiliodraft < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  version "2.35.0-draft.1"
  url "https://twilio-cli-prod.s3.amazonaws.com/channels/draft/twilio-v#{version}/twilio-v#{version}.tar.gz"
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
