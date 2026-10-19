class Lazyai < Formula
  desc "Terminal UI for local AI coding agents, in the style of lazydocker"
  homepage "https://github.com/t0d0r/lazyai"
  url "https://github.com/t0d0r/lazyai/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "47cf8c195d1b8b9d55caa286463ee207376ceaa6a00a50edd479e5605a071ba2"
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
