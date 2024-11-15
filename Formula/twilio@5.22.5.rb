require "language/node"

class TwilioAT5225 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v5.22.5/twilio-v5.22.5.tar.gz"
  version "5.22.5"
  sha256 "97b85e9e42bf9e2716f8f497b305bf5b25d0462873c638c54cdaf49968a703dc"
  depends_on "node@18"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    (bin/"twilio").write_env_script libexec/"bin/twilio", PATH: "#{Formula["node@18"].opt_bin}:$PATH"
  end

  def post_install
    node = Formula["node@18"].opt_bin/"node"
    pid = spawn("#{node} #{libexec}/welcome.js")
    Process.wait pid
  end
end
