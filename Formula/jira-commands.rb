class JiraCommands < Formula
  desc "Terminal client for the Jira ecosystem — fast, cross-platform, built in Rust"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.22.0"
  license "MIT"

  # jirac is an independent CLI tool for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-aarch64.tar.gz"
      sha256 "69ff946b11fdefcd3f9a8ce5b0ee0eb327904839f712c2779dd6390c24691a00"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-x86_64.tar.gz"
      sha256 "2d8567d432b86a43136bf3595687415fde18b417f673028facf53cf4239a85b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-aarch64.tar.gz"
      sha256 "bbc147a4d8535d1340096d503836950c6adf9f0a9511dd2fafde2ae868e9389c"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-x86_64.tar.gz"
      sha256 "34a686483b02f90d8ace1f162610a89bbcf434e0d67999f106a39de00fdc2003"
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
