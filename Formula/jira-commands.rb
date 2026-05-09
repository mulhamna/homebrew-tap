class JiraCommands < Formula
  desc "Terminal client for the Jira ecosystem — fast, cross-platform, built in Rust"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.35.0"
  license "MIT"

  # jirac is an independent CLI tool for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-aarch64.tar.gz"
      sha256 "908ee20cbb73ad06e4f67d02c23469a4d15b5f30ff91874ca35a99b005069836"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-x86_64.tar.gz"
      sha256 "5f1bfae826cb779d312249860a7611ac3f1438de4c927016d3053fd91464801b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-aarch64.tar.gz"
      sha256 "86d8fa67092d18724f08d83f7b23c6fb9fa0a3faf66d00e6109bd6aab74821a7"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-x86_64.tar.gz"
      sha256 "497b1acf5a6883f4b8dbabbd6a373394551b1219c61b252333e37fb6afa4dfc8"
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
