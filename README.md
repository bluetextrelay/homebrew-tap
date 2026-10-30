# Blue Text Relay Homebrew tap

Homebrew formula for `imx`, the command line for [Blue Text Relay](https://bluetextrelay.com), a self-hosted MCP server for iMessage.

```bash
brew trust bluetextrelay/tap      # Homebrew asks you to trust third-party taps once
brew install bluetextrelay/tap/imx
imx setup
```

`imx` reads the Messages database on your own Mac, so macOS asks you to grant it Full Disk Access once. `brew info bluetextrelay/tap/imx` prints the exact path to add.

- Docs: https://bluetextrelay.com/docs/
- For AI agents: https://bluetextrelay.com/llms.txt
- License: a license key is required ([buy](https://bluetextrelay.com/buy)). This tap only contains the formula; the binary is downloaded from bluetextrelay.com and checked against its SHA-256.

Apple, iMessage and Messages are trademarks of Apple Inc., registered in the U.S. and other countries and regions. Blue Text Relay is an independent product, not affiliated with or endorsed by Apple.
