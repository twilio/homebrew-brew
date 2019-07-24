require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v1.3.5/twilio-v1.3.5.tar.gz"
  version "1.3.5"
  sha256 "fddb2b087ffe3392a44940e54a047c8d0875eab35c7abd3b695b4017db6dfab4"
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
    ohai "*     twilio projects:add                              *"
    ohai "*                                                      *"
    ohai "********************************************************"
  end
end
