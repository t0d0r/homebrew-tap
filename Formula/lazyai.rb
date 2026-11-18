class Lazyai < Formula
  desc "Terminal UI for local AI coding agents, in the style of lazydocker"
  homepage "https://github.com/t0d0r/lazyai"
  url "https://github.com/t0d0r/lazyai/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "381ca7f5b89dc6cc6945a6856506b9695bb292bb1e5585967da71b3a53edc269"
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
