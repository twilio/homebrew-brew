require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v1.4.2/twilio-v1.4.2.tar.gz"
  version "1.4.2"
  sha256 "9b8c5c3937f316a523515229204b3730cc4852d6ee9e5f97cdf00b097f4a68bc"
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
