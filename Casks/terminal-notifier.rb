class TerminalNotifier < Formula
  desc "Post native macOS User Notifications from the command-line"
  homepage "https://github.com/iman1704/terminal-notifier"
  url "https://github.com/iman1704/terminal-notifier/archive/refs/tags/v0.0.1.tar.gz"
  version "0.0.1"
  # Since it's a local file URL, we can use a dummy SHA or omit it
  sha256 "4fe8c3574f55f87acf38dfc99547f309a12fc3da6d5246d0e4e81b805a360ae8"

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
