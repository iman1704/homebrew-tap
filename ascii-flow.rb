class AsciiFlow < Formula
  desc "ASCII ocean screensaver: fish schools hunted by ASCII sharks"
  homepage "https://github.com/iman1704/ascii-flow"
  url "https://github.com/iman1704/ascii-flow/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "d9f5f35841cef1c5aac8ed1cd9eea7c582d07225c9d0e275a56f14e37cae0fb3"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"asciiflow", ldflags: "-s -w"), "."
  end

  test do
    assert_match "screensaver", shell_output("#{bin}/asciiflow --help")
  end
end
