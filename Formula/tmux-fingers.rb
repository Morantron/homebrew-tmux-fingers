# Formula/tmux-fingers.rb

class TmuxFingers < Formula
  desc "mouseless terminal interaction"
  homepage "https://github.com/morantron/tmux-fingers"
  url "https://github.com/Morantron/tmux-fingers/archive/refs/tags/2.0.0.tar.gz"

  # run `brew fetch coveralls` to check SHA256
  sha256 "802c6be5ead722c5689a8fe559af0464b8ca6dfc040ed8d608038e66e31a2d15"
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
