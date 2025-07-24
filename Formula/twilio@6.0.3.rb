require "language/node"

class TwilioAT603 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v6.0.3/twilio-v6.0.3.tar.gz"
  version "6.0.3"
  sha256 "74f8add09680f8450c457f81f18d21528b244161fbc3342953fc0cc568f37046"
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
