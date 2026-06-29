class Addx < Formula
  desc "Universal AI tooling manager with a mouse-clickable TUI"
  homepage "https://github.com/mulhamna/addx"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/mulhamna/addx/releases/download/v0.3.0/addx-darwin-arm64"
      sha256 "748fdd1ba786858c4bf0de58cf3d7b0b86da93ed27d5455be0fcee3e8312b544"
    end
    on_intel do
      url "https://github.com/mulhamna/addx/releases/download/v0.3.0/addx-darwin-x64"
      sha256 "8557cee5f2e2421ffcab1e3bb4b1d2ef181cef4e73873601d9773562548fe2f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mulhamna/addx/releases/download/v0.3.0/addx-linux-arm64"
      sha256 "ca07633ec088de01ed4888f9cddcd939817b1f5175346d9426c9cb4d0bdf72a0"
    end
    on_intel do
      url "https://github.com/mulhamna/addx/releases/download/v0.3.0/addx-linux-x64"
      sha256 "c024840ed9e882e476efb08cc690fe8391bff8882ab39f0696a6269ceda53caa"
    end
  end

  def install
    bin.install Dir["addx-*"].first => "addx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/addx --version")
  end
end
