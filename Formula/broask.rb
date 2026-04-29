class Broask < Formula
  desc "Play a sound when CLI tools ask for confirmation"
  homepage "https://github.com/mulhamna/broask"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_darwin_arm64.tar.gz"
      sha256 "bbad708799dcd3af2e22b9076d94d8c5ea20080c7c6fd0c021ba376857960f1a"
    end

    on_intel do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_darwin_amd64.tar.gz"
      sha256 "1bc6010d5f5403f10727dc5b78d59b23a84623205016ca663c3625cf86bc1711"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_linux_arm64.tar.gz"
      sha256 "af9ed150f9da0ab53be20e39ad0ecb76a5aaa86a03f75213048ce6eca3959d8d"
    end

    on_intel do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_linux_amd64.tar.gz"
      sha256 "3edb29e1ff69caa2a91c550b11efaf48defdc6f6a5fd36dcf44a3d66c701a92a"
    end
  end

  def install
    bin.install "broask"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/broask version")
  end
end
