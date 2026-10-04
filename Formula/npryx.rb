class Npryx < Formula
  desc "Drop-in for npx that shows what a package will do before it runs"
  homepage "https://github.com/Jeecabs/npryx"
  url "https://registry.npmjs.org/npryx/-/npryx-1.0.0.tgz"
  sha256 "609fff1154804928f8ae4ef173df89301c33491a657de603fd34bbc48e2a2900"
  license "ISC"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "npryx #{version}", shell_output("#{bin}/npryx --version")
    output = shell_output("#{bin}/npryx --json ./local-script 2>&1")
    assert_match '"decision": "allow"', output
  end
end
