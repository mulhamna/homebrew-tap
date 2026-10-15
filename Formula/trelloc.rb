class Trelloc < Formula
  desc "Unofficial Trello CLI and MCP server"
  homepage "https://github.com/mulhamna/trello-commands"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.0.1/trelloc-macos-aarch64.tar.gz"
      sha256 "f7dc81b96d90dada963caab48d9f74846326b88b5ad043366e359a2bd25da543"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.0.1/trelloc-macos-x86_64.tar.gz"
      sha256 "709d7b1c420d8ee667cec8e6c90d2a019a96c77cbab8e696bef3af657b1b16ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.0.1/trelloc-linux-aarch64.tar.gz"
      sha256 "101c0425a70dfbff6409114ce45161b281b06a1548ced7d8552b43b2c4726faa"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.0.1/trelloc-linux-x86_64.tar.gz"
      sha256 "bb163964136a0b4bf1c7051cb58a800cfa5ad9ed33ee8057052164b93efef0b6"
    end
  end

  def install
    bin.install Dir["trelloc-*"].first => "trelloc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trelloc --version")
  end
end
