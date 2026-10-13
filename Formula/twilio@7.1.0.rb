require "language/node"

class TwilioAT710 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v7.1.0/twilio-v7.1.0.tar.gz"
  version "7.1.0"
  sha256 "b2fe90201196c8a86a96558d6c634b76842f9cd8b1903312ffd3520e9c9c357c"
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
