class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.37.0"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "b2857d4f9c464803df70c46aa3ecaadaecf12649731e75f2dacf4e0438c0d3c6"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "e40eacd773077f7f37fb58fb86f126504f70897148aca9872c3115e0ec9f0628"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "8189ee0b2c8cead65abe63726deade761d1b69fc297af92a5f489952276178b0"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "d550662aa8817ddaf197e2b06bf79ad09b14aeea2d167aeed9841091de350c5c"
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
