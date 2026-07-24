class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "2.3.4"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "96c5ab9ca8a8b8e916ecea37b63ea63898052daa88a3b4469483aa06b3072f7c"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "d5d7570f8cf411e4dd0ce6c32f8cc4b19419acca1fd4c71764caa4d0ffe092aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "24268f54c58304131c60111edf9c28c3f45c1bf64b395a9809fda69d9d6e2667"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "99909551e20fec550e85cd08986c13490645d8792ca24f42dd3682d483f723f8"
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
