class PomodoroTui < Formula
      desc "Simple Pomodoro timer with terminal UI (ratatui)"
      homepage "https://github.com/iman1704/pomodoro-tui"
      url "https://github.com/iman1704/pomodoro-tui/archive/refs/tags/v0.0.1.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
