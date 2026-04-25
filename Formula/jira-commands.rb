class JiraCommands < Formula
  desc "Terminal client for the Jira ecosystem — fast, cross-platform, built in Rust"
  homepage "https://github.com/mulhamna/jira-commands"
  version "0.18.0"
  license any_of: ["MIT", "Apache-2.0"]

  # jirac is an independent CLI tool for the Jira ecosystem.
  # It is not affiliated with or endorsed by Atlassian.

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-aarch64.tar.gz"
      sha256 "56627a038433b9ccb16281da66450ef6a3100b651114384480b351f9c398d81e"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-macos-x86_64.tar.gz"
      sha256 "62b65ef891b5bd1ad7ea36777c945b8def4553431bcae379473b1d6ec8bb0dba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-aarch64"
      sha256 "1c33474445c2ee755b99706513dc3fa06faef1517df23696b4934dc40930d97a"
    end

    on_intel do
      url "https://github.com/mulhamna/jira-commands/releases/download/v#{version}/jirac-linux-x86_64"
      sha256 "aff5e87797f869787fbb1becf436a5089651763819d5d56d87b3ab44868d2804"
    end
  end

  def install
    bin.install "jirac"
  end

  def caveats
    <<~EOS
      jirac is an independent tool and is not affiliated with Atlassian.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jirac --version")
  end
end
