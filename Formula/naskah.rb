class Naskah < Formula
  desc "TUI markdown note browser"
  homepage "https://github.com/iman1704/naskah"
  url "https://github.com/iman1704/naskah/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "40fc6d46c82db041fca2e52c055e40cb7b5b3a397359404cb68c4b4dcb85cd2a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"naskah"), "./cmd/naskah"
  end

  test do
    assert_match "Browse markdown notes", shell_output("#{bin}/naskah --help")
  end
end
