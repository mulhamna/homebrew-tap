class JiraCommands < Formula
  desc "Terminal client for the Jira ecosystem — fast, cross-platform, built in Rust"
  homepage "https://github.com/mulhamna/jira-commands"
  version "2.1.0"
  license "MIT"

  # jirac is an independent CLI tool for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-aarch64.tar.gz"
      sha256 "3429c2fc5dfe6598a37970bfded95f8f763a20e9cf1d53bab4a1a5e0102576e0"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-x86_64.tar.gz"
      sha256 "4b4e0cbd16a38c9af8c96d46a163cc033f032fa72392d300f83582a37de77057"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-aarch64.tar.gz"
      sha256 "7d4caac920f66656d5607fd0cf3bd0f1944b8bfe510fe07a032c12ba7ee8800f"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-x86_64.tar.gz"
      sha256 "70c903af235e830bf6cdaba9946b753f5547bd64f6110e6ec86d25f04114909c"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "jirac-macos-aarch64" : "jirac-macos-x86_64"
    else
      Hardware::CPU.arm? ? "jirac-linux-aarch64" : "jirac-linux-x86_64"
    end
    bin.install binary => "jirac"
    # Legacy symlink — keeps 'jira' working for existing users.
    # Will be removed in a future major release.
    bin.install_symlink "jirac" => "jira"
  end

  def caveats
    <<~EOS
      The binary has been renamed from 'jira' to 'jirac'.

      The old 'jira' command still works as a symlink for backward
      compatibility, but will be removed in a future major release.

      Please update your scripts and aliases:
        Before: jira issue list
        After:  jirac issue list

      jirac is an independent tool — not affiliated with Atlassian.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jirac --version")
    assert_match version.to_s, shell_output("#{bin}/jira --version 2>&1")
  end
end
