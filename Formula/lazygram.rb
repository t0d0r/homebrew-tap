class Lazygram < Formula
  desc "IRC-style terminal client for Telegram, in the spirit of BitchX and nchat"
  homepage "https://github.com/t0d0r/lazygram"
  url "https://github.com/t0d0r/lazygram/archive/refs/tags/v0.4.30.tar.gz"
  sha256 "87c91787238eb4fa2a42b7a21420ee1c79e83dbe2155ec66583f9218d43cda83"
  license "BSD-2-Clause"
  head "https://github.com/t0d0r/lazygram.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/lazygram"
  end

  test do
    assert_match "lazygram #{version}", shell_output("#{bin}/lazygram -version")
    assert_match "not linked", shell_output("#{bin}/lazygram -data #{testpath}/state 2>&1", 2)
  end
end
