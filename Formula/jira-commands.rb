class JiraCommands < Formula
  desc "Terminal client for the Jira ecosystem — fast, cross-platform, built in Rust"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.9.0"
  license "MIT"

  # jirac is an independent CLI tool for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-aarch64"
      sha256 "abe09b1256c8a18c2ca3a70b4cca8e6267feca487797c16b85702c654d50aca9"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-x86_64"
      sha256 "a35d898911af631ecd010f63a004785aad188af2030e501f1bd46ec7a85e4feb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-aarch64"
      sha256 "a4b21d77186f1c0f820b33f9a225ae6945768f77e0c4a01ab4ab8e5d54fdf560"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-x86_64"
      sha256 "7d9b6d296319968f9b75e975102eaa463a59c4e177ae769236e34a2630c32794"
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
