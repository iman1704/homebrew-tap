class Naskah < Formula
  desc "TUI markdown note browser"
  homepage "https://github.com/iman1704/naskah"
  version "0.1.0"
  license "MIT"

  livecheck do
    url "https://github.com/iman1704/naskah"
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/iman1704/naskah/releases/download/v0.1.0/naskah-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ed8482c6125d5b4ab7220bf261d07a17375a496742d713588987f12416241f35"
    else
      url "https://github.com/iman1704/naskah/releases/download/v0.1.0/naskah-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "688040cbae044054b7f956c2f310af8a5a518608fb4d486047a9fd17037053b7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/iman1704/naskah/releases/download/v0.1.0/naskah-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db20f714eb47b687a06575c66fe1bdcb6505073a84b3469bffd8e4e5fd584699"
    else
      url "https://github.com/iman1704/naskah/releases/download/v0.1.0/naskah-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e222fec34fd0ccda7ee068d4b5c2040a61768ed75b6ef514e2518e82c65a931"
    end
  else
    odie "Naskah supports macOS and Linux only."
  end

  def install
    bin.install "naskah"
  end

  post_install_steps do
    on_macos do
      run(
        "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{prefix}}"],
        must_succeed: false,
        print_stderr: false,
      )
    end
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      Naskah is not notarized by Apple. Homebrew attempts to clear the
      quarantine attribute during install; if macOS still blocks it, run:

        xattr -dr com.apple.quarantine "#{prefix}"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/naskah --version")
  end
end
