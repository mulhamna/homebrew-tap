class JiraMcp < Formula
  desc "Model Context Protocol server for Jira — typed tools for editors and AI agents"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.38.0"
  license "MIT"

  # jirac-mcp is an independent MCP server for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-aarch64.tar.gz"
      sha256 "56988a1467537c238c53b5d73e0d8a3b215d25300945b05fccbdbb8f38b3b2eb"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-macos-x86_64.tar.gz"
      sha256 "540c32b690159e51db0fac0545e58ed845ec2cfbe59b896c849532957aeac5d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-aarch64.tar.gz"
      sha256 "c9bfecfec98a99eb585c491d49cb4e8913b4ea384c8ec440fea1245c1532a22f"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-mcp-linux-x86_64.tar.gz"
      sha256 "e8504b11f89994e30bef48324f56ac19af5afb3760895ffcebcbb24e1402885a"
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
