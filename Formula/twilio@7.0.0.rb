require "language/node"

class TwilioAT700 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v7.0.0/twilio-v7.0.0.tar.gz"
  version "7.0.0"
  sha256 "01723f399d91b2c3fefaea1ccde5152482a53727f9713e0f11d1cc096e3189ec"
  depends_on "node@24"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    (bin/"twilio").write_env_script libexec/"bin/twilio", PATH: "#{Formula["node@24"].opt_bin}:$PATH"
  end

  def post_install
    node = Formula["node@24"].opt_bin/"node"
    pid = spawn("#{node} #{libexec}/welcome.js")
    Process.wait pid
  end
end
