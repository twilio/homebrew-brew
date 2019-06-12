require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/homebrew-brew/releases/download/v0.0.2/twilio-v1.2.0.zip"
  version "1.2.0"
  sha256 "d1da94c62b61bb851b604c8fa804ba7f199fc14bb34e2e84894381e90fecfc8b"
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