require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.12.0/twilio-v2.12.0.tar.gz"
  version "2.12.0"
  sha256 "defac5076ada2b5d80cd65e94260a57c4934ed40fc84cb1bfbdd04f9d4ce342e"
  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    ohai "********************************************************"
    ohai "*                                                     *"
    ohai "* To get started, please create a twilio-cli profile: *"
    ohai "*                                                     *"
    ohai "*     twilio login                                    *"
    ohai "*                                                     *"
    ohai "*     OR                                              *"
    ohai "*                                                     *"
    ohai "*     twilio profiles:create                          *"
    ohai "*                                                     *"
    ohai "********************************************************"
  end
end
