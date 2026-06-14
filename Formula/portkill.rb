class Portkill < Formula
  desc "Lightweight local port management tool"
  homepage "https://github.com/mr-tanta/portkill"
  url "https://github.com/mr-tanta/portkill/archive/refs/tags/v3.1.1.tar.gz"
  version "3.1.1"
  sha256 "4be05f61748ad93db87640183013dca7825f07cfabb125a6d654074b4d67ee80"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "bin/portkill"
    man1.install "man/portkill.1" if File.exist?("man/portkill.1")
  end

  def caveats
    <<~EOS
      PortKill requires administrative privileges to kill processes on system ports.

      Usage:
        portkill 3000                # Kill processes on port 3000
        portkill 3000 8080          # Kill processes on multiple ports
        portkill 3000-3005          # Kill processes on port range
        portkill list 3000          # List processes on port 3000
        portkill benchmark 3000     # Performance test port 3000
        portkill benchmark 80 google.com  # Test remote server performance
        portkill menu               # Interactive mode

      New in v3.1.1: Reliability & Packaging Fixes
      - Exact port matching avoids false positives
      - JSON history export and Docker JSON output fixes
      - Safer benchmark host validation
      - Improved install, uninstall, and release package assets

      For more information, run: portkill --help
    EOS
  end

  test do
    system "#{bin}/portkill", "--version"
    assert_match "PortKill 3.1.1", shell_output("#{bin}/portkill --version")
  end
end
