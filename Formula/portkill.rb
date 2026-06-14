class Portkill < Formula
  desc "Lightweight local port management tool"
  homepage "https://github.com/mr-tanta/portkill"
  url "https://github.com/mr-tanta/portkill/archive/refs/tags/v3.2.0.tar.gz"
  version "3.2.0"
  sha256 "bcdba82153275c02a65177442f92285d64de2e48ca44697c29485e0949145525"
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

      New in v3.2.0: Diagnostics & Presets
      - Preset port groups: --preset node|web|db|full
      - Read-only cache diagnostics: portkill cache doctor
      - Richer doctor output with restart guidance
      - Safer manual restart flow; PortKill does not auto-run commands

      For more information, run: portkill --help
    EOS
  end

  test do
    system "#{bin}/portkill", "--version"
    assert_match "PortKill 3.2.0", shell_output("#{bin}/portkill --version")
  end
end
