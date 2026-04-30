class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.27.1"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "b7667fd7074af4a49c764d2ac43640ba948d54f3957e077896b640ce9e1a95a3"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "24ee6a47ef80e1a7026bdd751b1dee790bcd28104755fab5b4b4ea7c49989aa1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "d1c6db66d7f1aec07d31caf3876eb152f63690cf4587f15f2cd147bd8915e9bb"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "b2d73449b7a4d11922e08d5dbd0c06d675eeedc9164554da0fadcab8c40d072b"
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
