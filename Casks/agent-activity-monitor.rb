cask "agent-activity-monitor" do
  version "0.1.1"
  sha256 "630c91ce9ba8abb5557baabca9985c1ce3acdfdc19de66116ae5248e15bdc40e"

  url "https://github.com/p9k-io/agent-activity-monitor/releases/download/v#{version}/Agent-Activity-Monitor-#{version}.dmg"
  name "Agent Activity Monitor"
  desc "Shows which processes exist because of AI coding agent sessions"
  homepage "https://github.com/p9k-io/agent-activity-monitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Agent Activity Monitor.app"
  binary "#{appdir}/Agent Activity Monitor.app/Contents/Helpers/aam"

  zap trash: [
    "~/Library/Application Support/io.p9k.agent-activity-monitor",
    "~/Library/Caches/io.p9k.agent-activity-monitor",
    "~/Library/HTTPStorages/io.p9k.agent-activity-monitor",
    "~/Library/Preferences/io.p9k.agent-activity-monitor.plist",
  ]
end
