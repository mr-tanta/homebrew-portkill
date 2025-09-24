class Portkill < Formula
  desc "Advanced port management and network analysis tool"
  homepage "https://github.com/mr-tanta/portkill"
  url "https://github.com/mr-tanta/portkill/archive/9ea54638854a943d84751008a1cf8472075cdfb0.tar.gz"
  version "2.0.0"
  sha256 "bf623bd4f71d9a499f971d4fe558231ebffbd86f12c946d8c058ce9483e31b94"
  license "MIT"

  depends_on "bash"

  def install
    bin.install "bin/portkill"
    man1.install "man/portkill.1" if File.exist?("man/portkill.1")
  end

  test do
    system "#{bin}/portkill", "--version"
    assert_match "PortKill 2.0.0", shell_output("#{bin}/portkill --version")
  end

  def caveats
    <<~EOS
      PortKill requires administrative privileges to kill processes on system ports.
      
      Usage:
        portkill 3000                # Kill processes on port 3000
        portkill 3000 8080          # Kill processes on multiple ports
        portkill 3000-3005          # Kill processes on port range
        portkill list 3000          # List processes on port 3000
        portkill menu               # Interactive mode
      
      For more information, run: portkill --help
    EOS
  end
end