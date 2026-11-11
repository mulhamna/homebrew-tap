class Trelloc < Formula
  desc "Unofficial Trello CLI and MCP server"
  homepage "https://github.com/mulhamna/trello-commands"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.3.0/trelloc-macos-aarch64.tar.gz"
      sha256 "9c088e2e5d84df36c0cbaf641f33bef582450b13951818079f4014f26e59f36f"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.3.0/trelloc-macos-x86_64.tar.gz"
      sha256 "1295e0d189e7bb62eeed7160ed9b1edd2b530aad2b9b8e7490a8b69267b841e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.3.0/trelloc-linux-aarch64.tar.gz"
      sha256 "e3b080283d0425bf9daa3709f454be03aa25ac33e1ba42f2140661f9e8a7678a"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.3.0/trelloc-linux-x86_64.tar.gz"
      sha256 "4186fb48e4f9f566c93a71087707ac92547e0ba9730fd0da1a1964cf0a95035f"
    end
  end

  def install
    bin.install Dir["trelloc-*"].first => "trelloc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trelloc --version")
  end
end
