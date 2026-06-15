class TerminalNotifier < Formula
  desc "Post native macOS User Notifications from the command-line"
  homepage "https://github.com/iman1704/terminal-notifier"
  url "https://github.com/iman1704/terminal-notifier/archive/refs/tags/v0.0.4.tar.gz"
  version "0.0.4"
  # Since it's a local file URL, we can use a dummy SHA or omit it
  sha256 "1353c3582c6c52c3c4ef06761d173ed324a89023037f331902ff7a9967eef0c4"

  def install
    # Build the application bundle using our build script
    system "./build.sh"

    # Install the app bundle under the Homebrew libexec folder
    libexec.install "terminal-notifier.app"

    # Symlink the bundle's internal binary to Homebrew's bin folder
    bin.install_symlink libexec/"terminal-notifier.app/Contents/MacOS/terminal-notifier" => "terminal-notifier"
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/terminal-notifier -version")
  end
end
