require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v1.3.0/twilio-v1.3.0.tar.gz"
  version "1.3.0"
  sha256 "ba97726cd6101bb47130b58425f4df579866a9f4d33782ce2a58a23b8ec45471"
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
