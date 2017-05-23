class Crowdin < Formula
  desc "Command-line tool that allows to manage your resources with crowdin.com"
  homepage "https://support.crowdin.com/cli-tool/"
  url "https://crowdin.com/downloads/crowdin-cli-2.0.15.zip"
  sha256 "f7dc2ac951e899cb6881df3cfbe731872c2baa3d60b1670473aa15963051d409"

  bottle :unneeded

  depends_on :java => "1.7+"

  def install
    bin.install "crowdin-cli.jar"
    crowdin = bin/"crowdin"
    crowdin.write <<-EOS.undent
      #!/bin/bash
      java -jar "#{bin}/crowdin-cli.jar" "$@"
    EOS
    chmod 0755, crowdin
  end

  test do
    system "java", "-jar", "#{bin}/crowdin-cli.jar"
  end
end
