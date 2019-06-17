require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v1.2.1/twilio-v1.2.1.tar.gz"
  version "1.2.1"
  sha256 "294fa3c307d2374deae3b4a57cbb166897ca23e9e9784c7397b82330f19ed254"
  depends_on "twilio/brew/twilio-cli-node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/twilio", "\"$DIR/node\"", "#{Formula["twilio-cli-node"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    ohai "*************************************************************************"
    ohai "*                                                                       *"
    ohai "* To get started, please login to your Twilio account:                  *"
    ohai "*                                                                       *"
    ohai "*     twilio login                                                      *"
    ohai "*                                                                       *"
    ohai "*     OR                                                                *"
    ohai "*                                                                       *"
    ohai "*     twilio projects:add                                               *"
    ohai "*                                                                       *"
    ohai "*************************************************************************"
  end
end
