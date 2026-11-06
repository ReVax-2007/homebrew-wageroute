cask "wageroute" do
  version "1.3.1"

  on_arm do
    sha256 "03d35b465e037eb8f7558fb3a183eac8e81c2ce96dda666b089f713772d2c1d3"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "b61ebf8790ec71115184c09606989c10ece8bb85b89a8084b9975e2ff59774b8"
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
