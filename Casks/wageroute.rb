cask "wageroute" do
  version "1.2.0"

  on_arm do
    sha256 "8bae502ac0365efb7cf57b8e7efb9030171e3f6fe552cbc2ab453092359fc157"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "50d92ea01c506fd7bddb91c94ca8736716b5810fefffe647fa36764bbaf39615"
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
