class Broask < Formula
  desc "Play a sound when CLI tools ask for confirmation"
  homepage "https://github.com/mulhamna/broask"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_darwin_arm64.tar.gz"
      sha256 "f68f032ddf9d7d2a2b179c52e13a5b0d1c33d809408fb60c3d2f78c2e828b59f"
    end

    on_intel do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_darwin_amd64.tar.gz"
      sha256 "58940eb1ebc4ee1bf85f91ee18b9d1cd8441a2ef42c7e70833f013b28bc2e3cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_linux_arm64.tar.gz"
      sha256 "9e3fd5d715795b12c399dcfc1dc86ce07bfe05cd6785412a86d54ea1d9a9cabb"
    end

    on_intel do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_linux_amd64.tar.gz"
      sha256 "693eb3b3320e40547a07f3f87a90739630d7c1d7a06d45b08328dd1ec540e563"
    end
  end

  def install
    bin.install "broask"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/broask version")
  end
end
