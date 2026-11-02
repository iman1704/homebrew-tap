class PomodoroTui < Formula
      desc "Simple Pomodoro timer with terminal UI (ratatui)"
      homepage "https://github.com/iman1704/pomodoro-tui"
      url "https://github.com/iman1704/pomodoro-tui/archive/refs/tags/v0.0.1.tar.gz"
      sha256 "afc80c0af53b123de33795150598ecb939e3ead009a73b8bed06a414da4be213"
      license "MIT"
      depends_on "rust" => :build

      def install
        system "cargo", "install", *std_cargo_args
      end

      livecheck do
        url :stable
        strategy :github_latest
      end

      test do
        assert_match "pomodoro", shell_output("#{bin}/pomodoro-tui --help")
        assert_match version.to_s, shell_output("#{bin}/pomodoro-tui --version")
      end
    end
