require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v1.3.6/twilio-v1.3.6.tar.gz"
  version "1.3.6"
  sha256 "999052c109a9e5471dc653f2e0671d568653cbbb6888046fa34d8b424f5600c2"
  depends_on "twilio/brew/twilio-cli-node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/twilio", "\"$DIR/node\"", "#{Formula["twilio-cli-node"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    ohai "********************************************************"
    ohai "*                                                      *"
    ohai "* To get started, please login to your Twilio account: *"
    ohai "*                                                      *"
    ohai "*     twilio login                                     *"
    ohai "*                                                      *"
    ohai "*     OR                                               *"
    ohai "*                                                      *"
    ohai "*     twilio profiles:add                              *"
    ohai "*                                                      *"
    ohai "********************************************************"
  end
end
