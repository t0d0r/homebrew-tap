class Lazygram < Formula
  desc "IRC-style terminal client for Telegram, in the spirit of BitchX and nchat"
  homepage "https://github.com/t0d0r/lazygram"
  url "https://github.com/t0d0r/lazygram/archive/refs/tags/v0.4.11.tar.gz"
  sha256 "e132a49cccf59f847328115a2b199ab76920860aacd9e309cddbea35f779cd0f"
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
