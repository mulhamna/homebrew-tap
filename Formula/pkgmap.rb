class Pkgmap < Formula
  desc "One command to see everything installed on your machine — across all package managers"
  homepage "https://github.com/mulhamna/pkgmap"
  url "https://registry.npmjs.org/@mulham28/pkgmap/-/pkgmap-2.0.3.tgz"
  sha256 "f04d6a8d18ae2636cbda1c6c2ec8e2439a6cc683537e580bb42bbe5c46f47ea8"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "pkgmap", shell_output("#{bin}/pkgmap --help")
  end
end
