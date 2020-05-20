require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v2.0.3/twilio-v2.0.3.tar.gz"
  version "2.0.3"
  sha256 "eaf6dd0cf8e9411eee1433d08f0c4a3ef85270c7aea379f65c1c58f483b135ef"
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
