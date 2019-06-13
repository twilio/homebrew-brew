class TwilioCliNode < Formula
    desc "node.js dependency for the Twilio CLI"
    homepage "https://github.com/twilio/twilio-cli"
    url "https://github.com/twilio/homebrew-brew/releases/download/v0.0.3/node-v10.16.0.zip"
    sha256 "22ce4285387142556012b1c8dd8ef496cbf07157075e3af9e5d368d9a507eb07"
  
    def install
        libexec.install buildpath/"node"
    end
  end
