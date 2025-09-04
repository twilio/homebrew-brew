require "language/node"

class TwilioAT611 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v6.1.1/twilio-v6.1.1.tar.gz"
  version "6.1.1"
  sha256 "5960ad7bf74d8ea05dc8ce22e9da104d847d0a2ad4b375d1df6797eb93816dfb"
  depends_on "node@20"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    (bin/"twilio").write_env_script libexec/"bin/twilio", PATH: "#{Formula["node@20"].opt_bin}:$PATH"
  end

  def post_install
    node = Formula["node@20"].opt_bin/"node"
    pid = spawn("#{node} #{libexec}/welcome.js")
    Process.wait pid
  end
end
