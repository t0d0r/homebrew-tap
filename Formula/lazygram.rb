class Lazygram < Formula
  desc "IRC-style terminal client for Telegram, in the spirit of BitchX and nchat"
  homepage "https://github.com/t0d0r/lazygram"
  url "https://github.com/t0d0r/lazygram/archive/refs/tags/v0.4.10.tar.gz"
  sha256 "d4bef408e4600a12a323740d5e2228fbd30d2188bf9f5064f592e03f6f9d2b97"
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
