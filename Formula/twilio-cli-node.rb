class TwilioCliNode < Formula
    desc "node.js dependency for the Twilio CLI"
    homepage "https://github.com/twilio/twilio-cli"
    url "https://twilio-cli-prod.s3.amazonaws.com/node-v10.16.0-darwin-x64.tar.gz"
    sha256 "6c009df1b724026d84ae9a838c5b382662e30f6c5563a0995532f2bece39fa9c"
  
    def install
        libexec.install buildpath/"bin/node"
    end
  end
