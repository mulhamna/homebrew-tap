class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "2.3.3"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "4f56fb300a025d623cfb8d4e85f706e1497aef4a45652d6a78821b77eba0a7b2"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "632882a4f77481935d6ab7a0a05bc0a3fcc7a68f684e7afc6899c9b0ec042f5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "2c7acb890561acd7228843a1f39e1bc40ce0e7120533b84a07c9703a426a26a2"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "64eb98d957a32c92783eed245ba23f1fe75f6739915a8193e3938bce3ec51028"
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
