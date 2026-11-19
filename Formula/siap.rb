class Siap < Formula
  desc "Opinionated Taskwarrior TUI"
  homepage "https://github.com/iman1704/siap"
  url "https://github.com/iman1704/siap/releases/download/v0.1.0/siap-v0.1.0-macos-arm64.tar.gz"
  version "0.1.0"
  sha256 "6dcf527ec532f8f31e6ad2b97fbf87cf1e91e652605ca8761805637aeb9a3153"
  license "MIT"

  depends_on "task"
  depends_on :macos
  depends_on arch: :arm64

  def install
    # Clear quarantine/provenance xattrs and re-apply an ad-hoc
    # signature so Gatekeeper and the arm64 kernel accept the binary.
    chmod 0755, "siap"
    quiet_system "/usr/bin/xattr", "-cr", "siap"
    system "/usr/bin/codesign", "--force", "--sign", "-", "siap"

    bin.install "siap"
  end

  def caveats
    <<~EOS
      siap is ad-hoc signed, not notarized. The install clears the
      quarantine attribute; if macOS still blocks it, run:
        xattr -d com.apple.quarantine "#{bin}/siap"
    EOS
  end

  test do
    assert_match "siap", shell_output("#{bin}/siap --help")
  end
end
