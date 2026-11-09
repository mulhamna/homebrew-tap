class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "3.0.0"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "f0d67d45ec2ca73bee56d523874177946b6ec696c846d4195170b5b4167d531f"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "fc4e53c7d456bcaf70b471380f6ff7fe22fb962f99e8769c338d8b32571ff005"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "00c6049be06b49d2f58abb80a078982e5595a24ce513ae23bbe69bdda2ccdd78"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/jira-mcp-v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "dc35d97ad6bddc1590a3342f9fc3b0c63680705fa87aa679ba2d0f76eabd5a12"
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
