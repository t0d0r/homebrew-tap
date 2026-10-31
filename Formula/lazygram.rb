class Lazygram < Formula
  desc "IRC-style terminal client for Telegram, in the spirit of BitchX and nchat"
  homepage "https://github.com/t0d0r/lazygram"
  url "https://github.com/t0d0r/lazygram/archive/refs/tags/v0.4.12.tar.gz"
  sha256 "ebb7d782ed93118011b644160dc662fd69175e62aad1aaf03afc3d8c7041ae3d"
  license "BSD-2-Clause"
  head "https://github.com/t0d0r/lazygram.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/lazygram"
  end

  test do
    assert_match "lazygram #{version}", shell_output("#{bin}/lazygram -version")
    assert_match "not linked", shell_output("#{bin}/lazygram -data #{testpath}/state 2>&1", 2)
  end
end
