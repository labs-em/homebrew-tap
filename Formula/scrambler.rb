class Scrambler < Formula
  desc "Lock any file with a password; double-click to unlock (Argon2id + AES-256-GCM)"
  homepage "https://github.com/labs-em/scrambler"
  version "1.0.0"
  license "Apache-2.0"

  disable! date: "2026-11-03", because: "is discontinued"

  on_macos do
    url "https://github.com/labs-em/scrambler/releases/download/v1.0.0/scrambler-mac-universal.tar.gz"
    sha256 "33f9f78f1625d335b96b9abee8f3f3fb51a4d3033f696e04ecf9e029f6cc2b4e"
  end

  on_linux do
    on_intel do
      url "https://github.com/labs-em/scrambler/releases/download/v1.0.0/Scrambler-linux-x86_64.tar.gz"
      sha256 "db17ef894727aaedec4e3c5a384895361757fc841f544409b102745e2b83926a"
    end
    on_arm do
      url "https://github.com/labs-em/scrambler/releases/download/v1.0.0/Scrambler-linux-arm64.tar.gz"
      sha256 "b947f9f84c735650da192952324451fb3b0057430f7fad4f43a736ce7c575b91"
    end
  end

  def install
    bin.install "scrambler"
    bin.install "scrambler-open" if OS.linux?
  end

  test do
    assert_match "scrambler scramble", shell_output("#{bin}/scrambler --help")
  end
end
