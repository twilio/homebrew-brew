require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v1.5.1/twilio-v1.5.1.tar.gz"
  version "1.5.1"
  sha256 "6549337ecc90ade1e0b4846ec8f7488b226a17498c52ad4031870722f92b88d2"
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
