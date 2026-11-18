cask "wageroute" do
  version "1.4.0"

  on_arm do
    sha256 "0e25f955275f994ed01397c5280c7f33bbf4e2b54c8cb3d034d322ba636804100"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "5ef99fa156f7d8da3957f519c6096f898547a106569dd9bba16c7cc384a24c77"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}-x64.dmg"
  end

  name "WageRoute"
  desc "Local-first paycheck routing and cash flow planner"
  homepage "https://github.com/ReVax-2007/wageroute"

  depends_on macos: :ventura

  app "WageRoute.app"

  # No zap stanza on purpose: user data (the ledger database) lives in
  # ~/Library/Application Support/WageRoute and must survive `brew uninstall --zap`.
end
