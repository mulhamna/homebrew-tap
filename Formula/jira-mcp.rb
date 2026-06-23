class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "2.3.2"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "4679f6371305048efa5507e00a00bce687707091617aed9fbbd4849a4ff8ce31"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "a5e78707e8af4bb143eb98062483f945826206610935332cf69a5846b734b186"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "22eac81390c134d1898fcd68f857d6ca0d721ac9d450d84a54826b0816e63ad6"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "3efdb9d83d1a9aae09ff41477aae08799b7a1aeb15e4491d14d9c4bd1e3bcc52"
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
