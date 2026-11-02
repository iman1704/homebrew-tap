class AsciiFlow < Formula
  desc "ASCII ocean screensaver: fish schools hunted by ASCII sharks"
  homepage "https://github.com/iman1704/ascii-flow"
  url "https://github.com/iman1704/ascii-flow/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "e621ad90af0e2511f7d485df2d2e4fc3f2f56f9de85aaa6b1bfcb2d7aa52d0a2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"asciiflow", ldflags: "-s -w"), "."
  end

  test do
    assert_match "screensaver", shell_output("#{bin}/asciiflow --help")
  end
end
