require "language/node"

class TwilioAT622 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v6.2.2/twilio-v6.2.2.tar.gz"
  version "6.2.2"
  sha256 "19043ed33d8ac596b8c1289d091564114f64ca8688cf7004ccb0fa63935710cf"
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
