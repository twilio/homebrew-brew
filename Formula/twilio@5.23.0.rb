require "language/node"

class TwilioAT5230 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://twilio-cli-prod.s3.amazonaws.com/twilio-v5.23.0/twilio-v5.23.0.tar.gz"
  version "5.23.0"
  sha256 "4d54728611f77fc132ff995a6c2d47b88f718cb77152dc44fef180eb405b7ae2"
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
