class TwilioCliNode < Formula
    desc "node.js dependency for the Twilio CLI"
    homepage "https://github.com/twilio/twilio-cli"
    url "https://github.com/twilio/homebrew-brew/releases/download/v.0.0.1/node-v12.4.0.zip"
    sha256 "95baab3965f0d12abaded40d73ae6bb3c651c0fad3981aef00db3e8d8a76a043"
  
    def install
        libexec.install buildpath/"node"
    end
  end
