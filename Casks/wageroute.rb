cask "wageroute" do
  version "1.0.2"

  on_arm do
    sha256 "0bba8a6896da4ed795cfa0f4ab4df9ae7acd3b70e1098e1895281e417d0e3601"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "6fb55398b9440e7a84efe9360f6aa3d1f4def1cac86f65638762cf2d503f258b"
    url "https://github.com/ReVax-2007/wageroute/releases/download/v#{version}/WageRoute-#{version}.dmg"
  end

  name "WageRoute"
  desc "Local-first paycheck routing and cash flow planner"
  homepage "https://github.com/ReVax-2007/wageroute"

  depends_on macos: ">= :ventura"

  app "WageRoute.app"

  # No zap stanza on purpose: user data (the ledger database) lives in
  # ~/Library/Application Support/WageRoute and must survive `brew uninstall --zap`.
end
