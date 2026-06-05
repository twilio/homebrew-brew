require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v6.2.4/twilio-v6.2.4.tar.gz"
  version "6.2.4"
  sha256 "fde2da58f02c400be405b4304bb7c5b53284b22428fe46fd86d0d24ff178d467"
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
