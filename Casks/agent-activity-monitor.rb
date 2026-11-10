cask "agent-activity-monitor" do
  version "0.1.0"
  sha256 "2bac31cf095b0111046486cce6a292d4bd987eb11c171f986e173d8693dce087"

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
