# Homebrew formula for nbk (prerelease / beta channel).
#
# Source of truth. The Release workflow (.github/workflows/release.yml) rewrites
# `version` + `sha256` from the published prerelease and copies this file into the
# tap repo at kimbirkelund/homebrew-tap:Formula/nbk-beta.rb on every rc/* release.
# Tracks release-candidate builds; `nbk` (stable) tracks final releases.
#
# Install:  brew install kimbirkelund/tap/nbk-beta
# Conflicts with the stable `nbk` — both install a `nbk` binary, so only one at a
# time (switch channels with `brew uninstall nbk && brew install nbk-beta`).
class NbkBeta < Formula
  desc "Keyboard-driven control of macOS notifications (prerelease channel)"
  homepage "https://github.com/kimbirkelund/mac-notifications-by-key"
  version "1.4.44-beta"
  url "https://github.com/kimbirkelund/mac-notifications-by-key/releases/download/release/v#{version}/nbk-#{version}-macos-universal.tar.gz"
  sha256 "2cf7b01aa1f662a2188bed74abfd824162207f97b7bd28e6e0e58de9d25e92d6"
  depends_on :macos
  conflicts_with "nbk", because: "both install a `nbk` binary"

  def install
    bin.install "nbk"
  end

  def caveats
    <<~EOS
      nbk drives the macOS Notification Center through the Accessibility API, so the
      process that runs it (your terminal, or skhd) must be granted Accessibility
      permission:

        System Settings → Privacy & Security → Accessibility

      Check status any time with:  nbk doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nbk --version")
  end
end
