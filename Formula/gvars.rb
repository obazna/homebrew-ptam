class Gvars < Formula
  desc "Lightweight and simple configuration library for C++ programs."
  homepage "http://www.edwardrosten.com/cvd/gvars3.html"
  url "http://www.edwardrosten.com/cvd/gvars-3.0.tar.gz"
  sha256 "fc051961d4da5dce99a20f525dc1e98368f7283aed7b20e68ffb35e34ac3f5fa"
  license "BSD-2-Clause"
  head "https://github.com/edrosten/gvars.git"

  depends_on "pkg-config" => :build
  depends_on 'toon' => :recommended
  depends_on 'fltk' => :optional
  depends_on 'readline'

  def toonflags
    build.with?('toon') ? '--with-TooN' : ''
  end

  def fltkflags
    build.without?('fltk') ? '--disable-fltk' : ''
  end

  def install
       # Avoid superenv shim
       ENV["PKG_CONFIG"] = Formula["pkg-config"].bin/"pkg-config"

       system "./configure", "--disable-debug",
                             "--disable-dependency-tracking",
                             "--prefix=#{prefix}",
                             toonflags, fltkflags
       system "make", "install"
  end
end