# Formula/tmux-fingers.rb

class TmuxFingers < Formula
  desc "mouseless terminal interaction"
  homepage "https://github.com/morantron/tmux-fingers"
  url "https://github.com/Morantron/tmux-fingers/archive/refs/tags/2.5.1.tar.gz"

  # run `brew fetch coveralls` to check SHA256
  sha256 "1f4c4fd4ff00b9992177a0f5b7e84e6b9b7c6af496b7224c392ae9b87b20f35e"
  license "MIT"

  # use :build, so if there's a bottle it will be used
  depends_on "crystal" => :build

  # dependencies of Crystal
  depends_on "bdw-gc"
  depends_on "libevent"
  depends_on "libyaml"
  depends_on "pcre2"

  # installation instructions
  def install
    system "shards", "install", "--production"
    system "shards", "build", "--production"
    system "strip", "./bin/tmux-fingers"
    bin.install "./bin/tmux-fingers"
  end

  # testing if binary is OK
  test do
    assert_match version.to_s, shell_output("#{bin}/tmux-fingers show-version").chomp
  end
end
