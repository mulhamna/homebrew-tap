class Trelloc < Formula
  desc "Unofficial Trello CLI and MCP server"
  homepage "https://github.com/mulhamna/trello-commands"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.0.0/trelloc-macos-aarch64.tar.gz"
      sha256 "803924ed2983ee1486fab762c8faf1c64f55f679980ae3b29e421dce61ce5f06"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.0.0/trelloc-macos-x86_64.tar.gz"
      sha256 "095f10e9f0f33e12683c2c071849f8fd3c686fd2df4be7eb114c1dd016cf4ca6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.0.0/trelloc-linux-aarch64.tar.gz"
      sha256 "de1a4612bfa0177acc27fbc334289fa6502485089a93d587071295a7076e58e5"
    end
    on_intel do
      url "https://github.com/mulhamna/trello-commands/releases/download/v1.0.0/trelloc-linux-x86_64.tar.gz"
      sha256 "e93721ae1d31ee3e16d4d221db4101a622a7cec954054ca0fd45177931228db2"
    end
  end

  def install
    bin.install Dir["trelloc-*"].first => "trelloc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/trelloc --version")
  end
end
