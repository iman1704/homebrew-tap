class TerminalNotifier < Formula
  desc "Post native macOS User Notifications from the command-line"
  homepage "https://github.com/iman1704/terminal-notifier"
  url "https://github.com/iman1704/terminal-notifier/archive/refs/tags/v0.0.3.tar.gz"
  version "0.0.3"
  # Since it's a local file URL, we can use a dummy SHA or omit it
  sha256 "2ebc267a5a5897d2f20715ff155d28a20d97d77829d0c7acdca94830ff26460b"

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
