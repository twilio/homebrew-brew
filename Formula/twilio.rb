require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/twilio/homebrew-brew/releases/download/v.0.0.1/twilio-cli-1.1.3.zip"
  version "1.1.2"
  sha256 "8742e240e5f054e7dc6e74ffe03c8276c8270e72b92d081cc8406305a9bd815c"
  depends_on "thinkingserious/brew/twilio-cli-node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/twilio", "\"$DIR/node\"", "#{Formula["twilio-cli-node"].opt_share}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def caveats
    s = <<-EOS
        *************************************************************************
        *                                                                       *
        * To get started, please login to your Twilio account:                  *
        *                                                                       *
        *     twilio login                                                      *
        *                                                                       *
        *     OR                                                                *
        *                                                                       *
        *     twilio projects:add                                               *
        *                                                                       *
        *************************************************************************
    EOS
    s
  end
end