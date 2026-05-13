class Pkgmap < Formula
  desc "One command to see everything installed on your machine — across all package managers"
  homepage "https://github.com/mulhamna/pkgmap"
  url "https://registry.npmjs.org/@mulham28/pkgmap/-/pkgmap-1.7.0.tgz"
  sha256 "20f43975215ec18bf806de940948a7a820d45b26e17ee99ee53a83451fa91770"
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
