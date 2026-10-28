cask "wageroute" do
  version "1.0.1"

  on_arm do
    sha256 "728b7bd1791ac11a01a5c3a50b3d783217be20c5f0fbb01a880e5d81bd734c95"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "5c081537a114b55917421e535ad975d92782060e5c4c39bfa3e4073ac829a4c8"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}.dmg"
  end

  name "WageRoute"
  desc "Local-first paycheck routing and cash flow planner"
  homepage "https://github.com/ReVax-2007/wageroute"

  app "WageRoute.app"

  # No zap stanza on purpose: user data (the ledger database) lives in
  # ~/Library/Application Support/WageRoute and must survive `brew uninstall --zap`.
end
