require "language/node"

class TwilioAT623 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v6.2.3/twilio-v6.2.3.tar.gz"
  version "6.2.3"
  sha256 "5ea50845defce3f88679084b774194a2537b463f38857fe5713ce574cf9a61b8"
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
