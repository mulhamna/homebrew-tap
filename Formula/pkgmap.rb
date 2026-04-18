class Pkgmap < Formula
  desc "One command to see everything installed on your machine — across all package managers"
  homepage "https://github.com/mulhamna/pkgmap"
  url "https://registry.npmjs.org/@mulham28/pkgmap/-/pkgmap-1.3.0.tgz"
  sha256 "9c2ff57783d008ae657acd7d3dcf0638af5298837663d971e345f96fa4a538bb"
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
