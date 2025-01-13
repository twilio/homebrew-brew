require "language/node"

class TwilioAT5228 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v5.22.8/twilio-v5.22.8.tar.gz"
  version "5.22.8"
  sha256 "3e102565a84cf1516b4b2573f835cbeb42c9e61ffbd867a63f7b3b6e3b1e3ef3"
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
