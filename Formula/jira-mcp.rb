class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.36.0"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "6a74731c2066facdb8c20e488ed3e9f2133d71290baff61bb246b9126d359f08"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "9394e3f46265c196153cba9690ed2419dfc0c7b8b18a6442e320dfa0a7a5d8ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "2f19966293a69d117c4b7660b0978cfce639ec28dfb80650b6faca8dde7883a1"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "95fd317b0cb2807567fc7a2bd5766ba140f8616391b95b3669f9e4e6df88afc5"
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
