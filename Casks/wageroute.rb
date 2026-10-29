cask "wageroute" do
  version "1.1.0"

  on_arm do
    sha256 "3f805f9f6f5ad0f70c908e47318349129b65f1faea5ef57ded12db3abe089331"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "d4be4512bc47dcc7566d691747de2e2002fc6d397896276bbcaa71f2cde376ba"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}.dmg"
  end

  name "WageRoute"
  desc "Local-first paycheck routing and cash flow planner"
  homepage "https://github.com/ReVax-2007/wageroute"

  depends_on macos: :ventura

  app "WageRoute.app"

  # No zap stanza on purpose: user data (the ledger database) lives in
  # ~/Library/Application Support/WageRoute and must survive `brew uninstall --zap`.
end
