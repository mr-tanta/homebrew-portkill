# PortKill Homebrew Tap

This is the official Homebrew tap for [PortKill](https://github.com/mr-tanta/portkill), an advanced port management and network analysis tool.

## Installation

```bash
brew install mr-tanta/portkill/portkill
```

Homebrew 6.0+ requires explicit trust for third-party taps before short-name installs. The command above trusts only the PortKill formula. If you have already tapped the repository and want to use `brew install portkill`, trust the formula first:

```bash
brew tap mr-tanta/portkill
brew trust --formula mr-tanta/portkill/portkill
brew install portkill
```

## Usage

```bash
# Kill processes on port 3000
portkill 3000

# Kill processes on multiple ports
portkill 3000 8080 9000

# Kill processes on port range
portkill 3000-3005

# List processes on port
portkill list 3000

# Interactive mode
portkill menu
```

## Support

For issues, feature requests, and documentation, visit the main repository:
https://github.com/mr-tanta/portkill
