require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v7.3.0/twilio-v7.3.0.tar.gz"
  version "7.3.0"
  sha256 "99bd5527145cb6aa9f7767438132fbcd8514d2dc282827ae839a84fc25e7952a"
  depends_on "node@22"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    (bin/"twilio").write_env_script libexec/"bin/twilio", PATH: "#{Formula["node@22"].opt_bin}:$PATH"
  end

  def post_install
    node = Formula["node@22"].opt_bin/"node"
    pid = spawn("#{node} #{libexec}/welcome.js")
    Process.wait pid
  end
end
