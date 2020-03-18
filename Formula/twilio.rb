require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v1.11.0/twilio-v1.11.0.tar.gz"
  version "1.11.0"
  sha256 "fe3404f1f1070eddfcfd9b588bfecda14ecbd59b7ef55a99edb77937386cd46a"
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
