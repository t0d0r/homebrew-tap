class Lazyai < Formula
  desc "Terminal UI for local AI coding agents, in the style of lazydocker"
  homepage "https://github.com/t0d0r/lazyai"
  url "https://github.com/t0d0r/lazyai/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "5144f42765f9cdbcea917234639da1f5e095868e7e7ea466d9edc97891da2daf"
  license "BSD-2-Clause"
  head "https://github.com/t0d0r/lazyai.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "tmux"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match "lazyai #{version}", shell_output("#{bin}/lazyai --version")
    assert_match "Usage: lazyai", shell_output("#{bin}/lazyai --help")
    assert_match "unknown command", shell_output("#{bin}/lazyai nope 2>&1", 2)
  end
end
