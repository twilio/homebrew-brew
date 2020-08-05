require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.7.0/twilio-v2.7.0.tar.gz"
  version "2.7.0"
  sha256 "f8d26aa37797a090e08a6a3fa6465e266db4144e9c0ecdfdbddc1c1ca3caff83"
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
