class Pkgmap < Formula
  desc "One command to see everything installed on your machine — across all package managers"
  homepage "https://github.com/mulhamna/pkgmap"
  url "https://registry.npmjs.org/@mulham28/pkgmap/-/pkgmap-1.11.1.tgz"
  sha256 "934f7e9d668586c154ad246e9018faa820823b17cdd27cda99ab054988d4e005"
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
