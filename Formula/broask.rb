class Broask < Formula
  desc "Play a sound when CLI tools ask for confirmation"
  homepage "https://github.com/mulhamna/broask"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_darwin_arm64.tar.gz"
      sha256 "0ac1e19a37f1e77ad617651eca06084de022af3eecc99f142064c0a7e714cc08"
    end

    on_intel do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_darwin_amd64.tar.gz"
      sha256 "cc320ad0633e4c1c48f820a338afaa6aa8c660b68c3a145419ba2aea821641ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_linux_arm64.tar.gz"
      sha256 "bc64965188b2386c4c067793fee5a17e8dcf345b55cdedecd939e200df0f8c28"
    end

    on_intel do
      url "https://github.com/mulhamna/broask/releases/download/v#{version}/broask_#{version}_linux_amd64.tar.gz"
      sha256 "9ad3556f49e8aa9df698877b75a772500b728955c9c9419317296800d22eb733"
    end
  end

  def install
    bin.install "broask"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/broask version")
  end
end
