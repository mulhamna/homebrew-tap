class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "3.2.0"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "dc4434f1dc69ea18d6482158af621e18758e5c56570b0efa7c59f44917e2ecdd"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "011010a021a666ceb4e65fe53a17feb108df46befe37142a76a5449fd2dcb158"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "d8c1fe1f26fd558bf5d5a33c1d4120a6a18743354d226d124d4dbd503b3fd9d7"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "d4c64c22722e6125039fc65710ef59a212464c50369157602757ecc11ba107a9"
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
