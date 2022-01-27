require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  version "3.0.0"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v#{version}/twilio-v#{version}.tar.gz"
  sha256 "8789f1d314ed4bd7c7081d4424fba24fdaa897850d8691a3c78fb8ebc10f5893"
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
