require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v7.2.0/twilio-v7.2.0.tar.gz"
  version "7.2.0"
  sha256 "31e9eb1d10feacd61db2c47036a7d27c880e607305de786250e243f2767727ad"
  depends_on "node@20"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    (bin/"twilio").write_env_script libexec/"bin/twilio", PATH: "#{Formula["node@24"].opt_bin}:$PATH"
  end

  def post_install
    node = Formula["node@20"].opt_bin/"node"
    pid = spawn("#{node} #{libexec}/welcome.js")
    Process.wait pid
  end
end
