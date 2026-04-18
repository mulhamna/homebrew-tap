class JiraCommands < Formula
  desc "Fast, cross-platform Jira terminal client built in Rust"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jira-macos-aarch64"
      sha256 "f53ce7d6674eb2e26f6570ff249e0d5eeef1538f85b116f719d8090a6ab61cdd"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jira-macos-x86_64"
      sha256 "a5c18651639e9454ab79007b7d364e9d3286e5bf37f34abd4912d18b15db5f35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jira-linux-aarch64"
      sha256 "ec54ee90d785e620545a26b5bd65b9849a5f368124a712d53c3b29a31b8e878d"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jira-linux-x86_64"
      sha256 "9d706116f01c1fb5b3bfb8696e55b1bd55d3857e34c500ea5e383c208a7c768e"
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
