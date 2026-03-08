class Portkill < Formula
  desc "Lightweight, zero-dependency port management tool following Unix philosophy"
  homepage "https://github.com/mr-tanta/portkill"
  url "https://github.com/mr-tanta/portkill/archive/v3.1.0.tar.gz"
  version "3.1.0"
  sha256 "f16e6e27aea630b245f1fdddfd45b6c2421f1c4e4c8d2801f63d3053b4835075"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "bin/portkill"
    man1.install "man/portkill.1" if File.exist?("man/portkill.1")
  end

  test do
    system "#{bin}/portkill", "--version"
    assert_match "PortKill 3.1.0", shell_output("#{bin}/portkill --version")
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
      
      New in v3.1.0: Stability & Cross-Platform Release
      - 20 bug fixes for reliability and correctness
      - Added ss fallback for process detection
      - macOS Bash 3.2 compatibility
      - --no-color flag and automatic TTY detection
      - Proper SIGTERM to SIGKILL escalation
      
      For more information, run: portkill --help
    EOS
  end
end