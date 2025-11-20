require "language/node"

class TwilioAT620 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v6.2.0/twilio-v6.2.0.tar.gz"
  version "6.2.0"
  sha256 "70026720014fb003c9be90809598b8d33acd3065944723f885f6fa35159bc357"
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
