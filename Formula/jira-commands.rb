class JiraCommands < Formula
  desc "Terminal client for the Jira ecosystem — fast, cross-platform, built in Rust"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.16.0"
  license "MIT"

  # jirac is an independent CLI tool for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-aarch64"
      sha256 "dd2e98640df7eb3d40ccb3ec194f8a1be035da83d4cdf06cf92608121973bff7"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-x86_64"
      sha256 "b047a2cb16bc5b555b686f9d42f9e7eabf8c325fc2deaeb0af5126e018e3117f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-aarch64"
      sha256 "e740a4270ab1a6b5e82ad799f2bff12a7e540260d8c13fd8a1a491d9f6f5d201"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-x86_64"
      sha256 "274fb06f34278388c32208296399f085f6e17feba1859010255979853c84e170"
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
