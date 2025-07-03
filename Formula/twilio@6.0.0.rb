require "language/node"

class TwilioAT600 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v6.0.0/twilio-v6.0.0.tar.gz"
  version "6.0.0"
  sha256 "785cb64d5d104dfa83dc2db53ed5cae2efef725f6fa174887010883dd2de73f2"
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
