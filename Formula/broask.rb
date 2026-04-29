class Broask < Formula
  desc "Play a sound when CLI tools ask for confirmation"
  homepage "https://github.com/mulhamna/broask"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_darwin_arm64.tar.gz"
      sha256 "REPLACE_DARWIN_ARM64_SHA"
    end

    on_intel do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_darwin_amd64.tar.gz"
      sha256 "REPLACE_DARWIN_AMD64_SHA"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_linux_arm64.tar.gz"
      sha256 "REPLACE_LINUX_ARM64_SHA"
    end

    on_intel do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_linux_amd64.tar.gz"
      sha256 "REPLACE_LINUX_AMD64_SHA"
    end
  end

  def install
    bin.install "broask"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/broask version")
  end
end
