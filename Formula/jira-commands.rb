class JiraCommands < Formula
  desc "Fast, cross-platform Jira terminal client built in Rust"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jira-macos-aarch64"
      sha256 "2141151212b17a78b6b79c5889b24388fdb1713eb8377f65a1a177c469c13a87"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jira-macos-x86_64"
      sha256 "299c339120d49667ee8c1b5ba9d19422787d63c4fb87b1ed7dd46449b5080ab9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jira-linux-aarch64"
      sha256 "e8dde0f03c3f9918d0ccfa04376749205ca944d723d423695290967719d15b82"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jira-linux-x86_64"
      sha256 "724ab746b6f96e873893f3f1c40bf2af7539eb8048b7c7a4a30e353accb074a7"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "jira-macos-aarch64" : "jira-macos-x86_64"
    else
      Hardware::CPU.arm? ? "jira-linux-aarch64" : "jira-linux-x86_64"
    end
    bin.install binary => "jira"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jira --version")
  end
end
