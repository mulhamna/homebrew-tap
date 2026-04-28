class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.21.2"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "795e1e4f55d9473330d96a0d8cabee68e38265152a9c7a8869f9419e35f0a103"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "3802a2a15c6ee3da9282517fe4518de36e39652957de8a2e42fe27b783000a92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "26a9e86d5b95844b1e51cdba59636f03f634b3c76cb97015a55b92c7c4f75aaa"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "11001ae01e9ee37e3d94d21112f865479363f28e08a65110ae1ff88f5a1be626"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "jirac-mcp-macos-aarch64" : "jirac-mcp-macos-x86_64"
    else
      Hardware::CPU.arm? ? "jirac-mcp-linux-aarch64" : "jirac-mcp-linux-x86_64"
    end

    bin.install binary => "jirac-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jirac-mcp --version")
  end
end
