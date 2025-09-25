class Portkill < Formula
  desc "Advanced port management and network analysis tool with performance benchmarking"
  homepage "https://github.com/mr-tanta/portkill"
  url "https://github.com/mr-tanta/portkill/archive/v2.3.0.tar.gz"
  version "2.3.0"
  sha256 "65e5e15da6a527b90b82796707e9b2835cf31f03945d7ae941c15bf22feced09"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "bin/portkill"
    man1.install "man/portkill.1" if File.exist?("man/portkill.1")
  end

  test do
    system "#{bin}/portkill", "--version"
    assert_match "PortKill 2.3.0", shell_output("#{bin}/portkill --version")
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
      
      New in v2.3.0: Port Performance Benchmarking
      - Test connection speed and reliability
      - Comprehensive performance metrics
      - Support for local and remote hosts
      
      For more information, run: portkill --help
    EOS
  end
end