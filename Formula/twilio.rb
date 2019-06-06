require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://registry.npmjs.org/twilio-cli/-/twilio-cli-1.1.2.tgz"
  version "1.1.2"
  sha256 "2cdb338f7653949de7e17c9911d12a4a50bc1a62d73c2c4250cdee023b7b88d3"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
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
