require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/homebrew-brew/releases/download/v0.0.3/twilio-v1.2.0.zip"
  version "1.2.0"
  sha256 "6039a1d29b52266ecb8888fef8fa3e5c533a9affa781a06aa0abe27e70ef13d9"
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