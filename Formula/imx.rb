# Homebrew formula for imx, the Blue Text Relay CLI: brew install bluetextrelay/tap/imx
# url and sha256 are updated with each release.
class Imx < Formula
  desc "Self-hosted MCP server for iMessage (Blue Text Relay CLI)"
  homepage "https://bluetextrelay.com"
  url "https://downloads.bluetextrelay.com/imx-1.0.0-macos.tar.gz"
  # Placeholder until the first release ships; Homebrew refuses to install on a mismatch,
  # so this can never install an unverified binary. Real value comes from the release's SHA256SUMS.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license :cannot_represent

  depends_on macos: :sonoma

  def install
    # Universal (arm64 + x86_64) binary, signed and notarized at release time.
    bin.install "imx"
    doc.install "HEADLESS.md", "PRIVACY.md", "LICENSE"
  end

  def caveats
    <<~EOS
      imx reads the Messages database, so it needs Full Disk Access (macOS asks once):
        System Settings > Privacy & Security > Full Disk Access > + > #{opt_bin}/imx
        open "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles"

      Then:
        imx setup              # pick threads, create an access key, choose Tailscale
        imx service install    # optional: keep it running at login
    EOS
  end

  test do
    # imx opens the Messages database at startup, which the test sandbox can't read,
    # so only check that the binary landed.
    assert_predicate bin/"imx", :executable?
  end
end
