class Portkill < Formula
  desc "Lightweight, zero-dependency port management tool following Unix philosophy"
  homepage "https://github.com/mr-tanta/portkill"
  url "https://github.com/mr-tanta/portkill/archive/v3.0.0.tar.gz"
  version "3.0.0"
  sha256 "202bf7af45def6f67713514d6b8a27fa1174e5f8520e7091c0129281fe5ff1b2"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "bin/portkill"
    man1.install "man/portkill.1" if File.exist?("man/portkill.1")
  end

  test do
    system "#{bin}/portkill", "--version"
    assert_match "PortKill 3.0.0", shell_output("#{bin}/portkill --version")
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
      
      New in v3.0.0: SIMPLIFICATION RELEASE - Back to Unix Roots
      - Zero dependencies: Pure Bash with standard Unix utilities only
      - Lightweight: 200x smaller than alternatives (72KB total)
      - Reliable: Simpler code means fewer bugs
      - Fast: Instant startup, no runtime overhead
      
      For more information, run: portkill --help
    EOS
  end
end