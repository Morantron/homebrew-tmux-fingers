# Formula/tmux-fingers.rb

class TmuxFingers < Formula
  desc "mouseless terminal interaction"
  homepage "https://github.com/morantron/tmux-fingers"
  url "https://github.com/Morantron/tmux-fingers/archive/refs/tags/2.2.1.tar.gz"

  # run `brew fetch coveralls` to check SHA256
  sha256 "b05a4dd5c229e1fe86fc41c9c4df4477a50ae3ffe56bea115e0a81c80a43f142"
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
