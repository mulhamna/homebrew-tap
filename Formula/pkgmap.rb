class Pkgmap < Formula
  desc "One command to see everything installed on your machine — across all package managers"
  homepage "https://github.com/mulhamna/pkgmap"
  url "https://registry.npmjs.org/@mulham28/pkgmap/-/pkgmap-1.8.0.tgz"
  sha256 "122e0ae2115d618bb271332a3a4c3088f70cd38367852a22e03cd0c604a330dd"
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
