require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v1.3.3/twilio-v1.3.3.tar.gz"
  version "1.3.3"
  sha256 "bcb1da45f53b8fc1cbf14932c282bbd06d832bd11152da63fc48831c3d32df71"
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
    ohai "*     twilio projects:add                              *"
    ohai "*                                                      *"
    ohai "********************************************************"
  end
end
