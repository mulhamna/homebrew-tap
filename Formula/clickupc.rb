class Clickupc < Formula
  desc "Unofficial ClickUp CLI and MCP server"
  homepage "https://github.com/mulhamna/clickup-commands"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.0.1/clickupc-macos-aarch64.tar.gz"
      sha256 "84980ae93f2f1f7c852f2f9e581477f09ee36b5d42e836becc3480daa2df60de"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.0.1/clickupc-macos-x86_64.tar.gz"
      sha256 "9de6912f94097a188112c0c70b5dac59337e4735c1541fc5cdeaffa80c2e0eca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.0.1/clickupc-linux-aarch64.tar.gz"
      sha256 "7dcf51207026431201b921d79ca5472f9b5359cddb459d8ce1f478c1effe78e7"
    end
    on_intel do
      url "https://github.com/mulhamna/clickup-commands/releases/download/v1.0.1/clickupc-linux-x86_64.tar.gz"
      sha256 "567393bb5a3e71af873b92a7321c2dc7639eb2fabb3490e5716d8cd16a52f4bd"
    end
  end

  def install
    bin.install Dir["clickupc-*"].first => "clickupc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clickupc --version")
  end
end
