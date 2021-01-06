require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.15.2/twilio-v2.15.2.tar.gz"
  version "2.15.2"
  sha256 "68a0a9e1898fae3f978a02a536d21cfb1ce52fd3cff3dd5498ae9cb2ff735174"
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
